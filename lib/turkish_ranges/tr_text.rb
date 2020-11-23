# frozen_string_literal: true

module TurkishRanges
  # Represents a character sequence in Turkish language
  class TrText
    include Comparable

    # Sets the letters for the `TrText`.
    # @return [String] character sequence
    attr_reader :letters

    private :letters

    # Using for character mapping
    MAP = 'DHJPTVdhiptvÈğıØşÝèĠĲøŠý'.chars.zip('ÇĞİÖŞÜçğıöşüDHJPTVdhiptv'.chars).to_h.freeze

    # Using for calculating character codes
    ASCII_ALPHABET = 'ABCÇDEFGĞHIİJKLMNOÖPQRSŞTUÜVWXYZabcçdefgğhıijklmnoöpqrsştuüvwxyz'
                     .chars.map.with_index { [_1, _2 + 65] }.to_h.freeze

    # A new instance of TrText
    #
    # @param [String] letters
    # @return [TrText]
    def initialize(letters)
      @letters = letters
    end

    # Using for object comparison
    #
    # @param [TrText] other
    # # @return [Integer] 1, 0 or -1
    def <=>(other)
      codepoints_sum <=> other.codepoints_sum
    end

    # Calculates codepoint of a single characacter based on ASCII_ALPHABET
    #
    # @return [Integer]
    def code
      ASCII_ALPHABET[letters] || letters&.ord.to_i
    end

    # Calculates the sum of codepoints in letters
    #
    # @return [Integer]
    def codepoints_sum
      letters.chars.map { TrText.new(_1) }.map(&:code).inject(:+)
    end

    # Calculates the successor string from `letters`
    #
    # @return [String]
    def succ_letter
      successor = letters.succ
      change = successor.delete(letters)
      successor.sub!(change, MAP[change]) if change.length == 1 && MAP.key?(change)
      successor
    end

    # Next successor character sequence
    #
    # @return [TrText]
    def succ
      TrText.new(succ_letter)
    end

    # Overloading Object#to_s
    #
    # @return [String]
    def to_s
      letters
    end

    # Overloading Object#inspect
    #
    # @return [String]
    def inspect
      letters
    end
  end
end

(TurkishRanges::TrText.new("a")..TurkishRanges::TrText.new("z")).to_a
