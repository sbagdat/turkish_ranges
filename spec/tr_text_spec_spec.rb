# frozen_string_literal: true

require 'spec_helper'

RSpec.configure do |config|
  config.include TurkishRanges
  include TurkishRanges
end

RSpec.describe 'TrLetterSpec' do
  context '#new' do
    it 'creates new object' do
      expect(TrText.new('Ü')).not_to be nil
    end
  end

  context '#code' do
    it 'returns correct extended ascii code' do
      expect(TrText.new('A').code).to eq 65
      expect(TrText.new('ş').code).to eq 120
    end
  end

  context '#codepoints_sum' do
    it 'returns total codepoints of letters' do
      expect(TrText.new('ABCÇ').codepoints_sum).to eq 65 + 66 + 67 + 68
    end
  end

  context 'when doing comparisons' do
    it 'can compare two letters' do
      expect(TrText.new('Ş') > TrText.new('Ğ')).to  be true
      expect(TrText.new('ç') < TrText.new('d')).to  be true
      expect(TrText.new('z') < TrText.new('ö')).to  be false
      expect(TrText.new('ğ') < TrText.new('ü')).to  be true
      expect(TrText.new('ş') < TrText.new('ü')).to  be true
      expect(TrText.new('U') > TrText.new('ç')).to  be false
      expect(TrText.new('H') > TrText.new('Ğ')).to  be true
      expect(TrText.new('ç') != TrText.new('Ç')).to be true
      expect(TrText.new('Ğ') == TrText.new('ğ'.upcase(:turkic))).to be true
    end
  end

  context 'when creating ranges' do
    it 'creates a full ranges of single character' do
      a_to_z_lower_case = 'abcçdefgğhıijklmnoöpqrsştuüvwxyz'
      a_to_z_upper_case = 'ABCÇDEFGĞHIİJKLMNOÖPQRSŞTUÜVWXYZ'
      lower_case_range = TrText.new('a')..TrText.new('z')
      upper_case_range = TrText.new('A')..TrText.new('Z')

      expect(lower_case_range.to_a.join).to eq a_to_z_lower_case
      expect(upper_case_range.to_a.join).to eq a_to_z_upper_case
    end

    it 'creates partial ranges of single character' do
      c_to_s_lower_case = 'çdefgğhıijklmnoöpqrsş'
      g_to_u_upper_case = 'ĞHIİJKLMNOÖPQRSŞTUÜ'
      lower_case_range = TrText.new('ç')..TrText.new('ş')
      upper_case_range = TrText.new('Ğ')..TrText.new('Ü')

      expect(lower_case_range.to_a.join).to eq c_to_s_lower_case
      expect(upper_case_range.to_a.join).to eq g_to_u_upper_case
    end

    it 'creates ranges of mutliple characters' do
      z_to_ad_lower_case = 'zaaabacaçad'
      z_to_ad_upper_case = 'ZAAABACAÇAD'
      lower_case_range = TrText.new('z')..TrText.new('ad')
      upper_case_range = TrText.new('Z')..TrText.new('AD')

      expect(lower_case_range.to_a.join).to eq z_to_ad_lower_case
      expect(upper_case_range.to_a.join).to eq z_to_ad_upper_case
    end
  end
end
