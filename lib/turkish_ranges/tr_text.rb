# frozen_string_literal: true

module TurkishRanges
  # Represents a character sequence in Turkish language
  class TrText
    include Comparable

    # Sets the letters for the `TrText`.
    # @return [String] character sequence
    attr_reader :letters, :letters_length

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
      @letters_length = letters.length
    end

    # Using for object comparison
    #
    # @param [TrText] other
    # @return [Integer] 1, 0 or -1
    def <=>(other)
      return 0 if letters == other.letters

      compare_chars(zip_chars_with(other))
    end

    # Calculates codepoint of a single characacter based on ASCII_ALPHABET
    #
    # @return [Integer]
    def code
      ASCII_ALPHABET[letters] || letters&.ord.to_i
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

    protected

    # Creates a zipped array from letters
    #
    # @param [TrText] other
    # @return [Array] contains char pairs of each letters
    def zip_chars_with(other)
      max_length = [letters_length, other.letters_length].max
      left_side = letters.ljust(max_length).chars
      right_side = other.letters.ljust(max_length).chars
      left_side.zip(right_side)
    end

    private

    # Compares left and right side of spaceship operator
    # If left side is bigger than right side returns 1,
    # otherwise returns -1
    #
    # @param [Array] zipped_chars
    # @return [Integer] 1 or -1
    def compare_chars(zipped_chars)
      zipped_chars.each do |char_pairs|
        left, right = char_pairs
        next if left == right

        return single_char(left).code > single_char(right).code ? 1 : -1
      end
    end

    # Creates an instance of TrText
    #
    # @param [String] letter
    # @return [TrText]
    def single_char(letter)
      self.class.new(letter)
    end
  end
end
