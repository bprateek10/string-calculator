require 'pry'

class StringCalculator
  def add(nums)
    return 0 if empty_input?(nums)

    delimiter = determine_delimiter(nums)
    validate_consecutive_delimiters(nums, delimiter)
    nums_array = extract_numbers(nums, delimiter)
    validate_numbers(nums_array)

    sum_numbers(nums_array)
  end

  private

  def empty_input?(nums)
    nums.nil? || nums.empty?
  end

  def determine_delimiter(nums)
    delimiter = /,|\n/
    if nums.start_with?('//')
      parts = nums.split("\n", 2)
      custom_delimiter = parts[0][2..-1]
      delimiter = Regexp.escape(custom_delimiter)
    end
    delimiter
  end

  def validate_consecutive_delimiters(nums, delimiter)
    if nums.match(/#{delimiter}{2}/)
      raise ArgumentError, 'Invalid input'
    end
  end

  def extract_numbers(nums, delimiter)
    nums_array = nums
      .split(/#{delimiter}|,|\n/)
      .map(&:to_i)
    nums_array
  end

  def validate_numbers(nums_array)
    negatives = nums_array.select { |num| num < 0 }
    unless negatives.empty?
      raise ArgumentError, "Negative numbers not allowed: #{negatives.join(', ')}"
    end
  end

  def sum_numbers(nums_array)
    nums_array.reduce(0, :+)
  end
end
