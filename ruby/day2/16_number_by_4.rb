numbers = (1..16).to_a
counter = 0

# output would be:  
# 1 2 3 4
# 5 6 7 8
# 9 10 11 12
# 13 14 15 16
numbers.each do |number|
  print "#{number} "
  counter += 1
  if counter % 4 == 0
    puts
  end
end

# same with each_slice
numbers.each_slice(4) { |number| puts number.join(' ')}