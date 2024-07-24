def add_numbers(input_string)
  delimiter_regex = /^\/\/(.)\n/
  
  delimiter_match = input_string.match(delimiter_regex)
  if delimiter_match
    delimiter = Regexp.escape(delimiter_match[1])
    numbers_string = input_string.sub(delimiter_regex, '')
  else
    delimiter = "[,\n]"
    numbers_string = input_string
  end
  raise ArgumentError, "Input contains non-numeric characters" if numbers_string.match?(/[^0-9#{delimiter}\.\-\s]/)
  raise ArgumentError, "Negative numbers not allowed" if numbers_string.match?(/-\d/) and return "#{numbers_string.scan(/-\d+/).join(',')}" if numbers_string.include?('-')
  return 0 if numbers_string.empty?
  numbers = numbers_string.split(/#{delimiter}/).map do |num_str|
    begin
      Float(num_str.strip)
    rescue ArgumentError, TypeError
      0
    end
  end
  
  numbers.sum
end
