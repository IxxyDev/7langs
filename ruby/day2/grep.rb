needle = gets.chomp
file_path = File.expand_path("./text.txt")

def grep(file_path, needle)
  current_line = 0

  File.open(file_path, 'r').each_line do |line|
    current_line += 1
    puts "#{current_line} #{line}" if line.include?(needle)
  end
end

grep(file_path, needle)