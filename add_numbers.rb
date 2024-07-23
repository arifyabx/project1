def add_numbers(input_string)
  raise ArgumentError, "Input contains non-numeric characters" if input_string.match?(/[^0-9,\n.\-\s]/)
  raise ArgumentError, "Negative numbers not allowed" if input_string.match?(/-\d/) and return "#{input_string.scan(/-\d+/).join(',')}" if input_string.include?('-')
  return 0 if input_string.empty?
  numbers = input_string.split(/[,\n]/).map do |num_str|
    begin
      Float(num_str.strip)
    rescue ArgumentError, TypeError
      0
    end
  end
  
  numbers.sum
end
