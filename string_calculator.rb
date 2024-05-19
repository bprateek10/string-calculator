class StringCalculator
  def add(nums)
    return 0 if nums.nil? || nums.empty?

    delimiter = /,|\n/
    if nums.start_with?('//')
      parts = nums.split("\n", 2)
      delimiter = Regexp.escape(parts[0][2..-1])
      nums = parts[1]
    end

    # Check for invalid input: consecutive delimiters
    if nums.match(/#{delimiter}{2,}|,{2,}|\n{2,}/)
      raise ArgumentError, "Invalid input"
    end

    nums = nums.split(/#{delimiter}|,|\n/)

    sum = nums.reduce(0) { |acc, num| acc + num.to_i }

    sum
  end
end
