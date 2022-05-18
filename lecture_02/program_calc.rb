puts 'insert cmd: sum or next'
cmd = gets.strip

if cmd == 'sum'
  puts 'input first value'
  a = gets.strip.to_i

elsif cmd == 'next' # if input value is 5, output will be 6
else
  puts 'something goes wrong'
end
