# frozen_string_literal: true

# LuhnValidator
module LuhnValidator
  # Validates credit card number using Luhn Algorithm
  # arguments: none
  # assumes: a local String called 'number' exists
  # returns: true/false whether last digit is correct
  def validate_checksum
    nums_a = number.to_s.chars.map(&:to_i)
    # puts nums_a
    # TODO: use the integers in nums_a to validate its last check digit

    all = 0
    nums_a.reverse.each_slice(2) do |odd, even|
      all += odd
      if even.is_a? Integer
        even *= 2
        all += even / 10 >= 1 ? ((even % 10) + 1) : even
      end
    end
    # puts all
    (all % 10).zero? ? true : false
  end
end
