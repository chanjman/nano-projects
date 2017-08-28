# lib/string_calculator.rb
class StringCalculator
  def self.add(input)
    input.empty? ? 0 : input.split(',').map(&:to_i).inject(&:+)
  end
end
