class StringCalculator
  def add( nums )
    return 0 if nums.nil? || nums.empty?
    
    return nums.split(',').map(&:to_i).reduce(:+)
  end
end