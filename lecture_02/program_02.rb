puts ARGV

filename = ARGV.first

out = File.readlines(filename)

puts out
