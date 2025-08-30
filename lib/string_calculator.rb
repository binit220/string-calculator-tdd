class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?
   
    delimiter_regex = /[,\n]/
    
    if numbers.start_with?('//')
      delimiter_line, numbers = numbers.split("\n", 2)
      custom_delimiter = delimiter_line[2..]
      delimiter_regex = Regexp.escape(custom_delimiter)
    end
    
    number_array = numbers.split(/#{delimiter_regex}/).map(&:to_i)

    negatives = number_array.select { |n| n < 0 }
    unless negatives.empty?
      raise "negative numbers not allowed #{negatives.join(',')}"
    end
    
    number_array.sum
  end
end