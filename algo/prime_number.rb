# Use RSpec to test the following exercise! You may wish to wrap the methods below in a class to help facilitate this.

# First, implement the is_prime? method below. It should accept a number as an argument and return
# true if the number is prime and false if it is not. A prime number is a number that is only
# divisible by itself and the number 1.
require 'rspec'

class Primer
  def is_prime?(number)
    counter = 0
    range = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]
    range.each do |range_number|
      if (number % range_number).zero? && number != range_number
        counter += 1
      end
    end
    counter.zero? 
  end

  # Second, implement the highest_prime_number_under method below. It should accept a number as
  # an argument and return the highest prime number under that number. For example, the 
  # highest prime number under 10 is 7.

  def highest_prime_number_under(number)
    range = (0..(number - 1)).to_a
    under = 0
    range.each do |tester|
      if is_prime?(tester) == true
        under = tester
      end
    end
    under
  end
end

RSpec.describe Primer do
  let(:primer) { Primer.new }

  describe 'is_prime?' do
    it "should return true given 7." do
      expect(primer.is_prime?(7)).to eq(true)
    end
  end

  describe 'is_prime?' do
    it "should return false given 27." do
      expect(primer.is_prime?(27)).to eq(false)
    end
  end

  describe 'highest_prime_number_under?' do
    it "should return 7 given 10." do
      expect(primer.highest_prime_number_under(10)).to eq(7)
    end
  end

  describe 'highest_prime_number_under?' do
    it "should return 5 given 7." do
      expect(primer.highest_prime_number_under(7)).to eq(5)
    end
  end
end

