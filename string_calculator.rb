class StringCalculator
  def add( nums )
    return 0 if nums.nil? || nums.empty?
    
    if nums.match(/,\n|\n,|,,|\n\n/)
      raise ArgumentError, "Invalid input"
    end
    
    nums = nums.split(/,|\n/)
    
    sum = 0
    
    nums.each do |num|
      sum += num.to_i
    end
    
    sum
  end
end