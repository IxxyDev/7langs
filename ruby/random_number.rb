answer = rand(10)
puts "Guess a number between 0 and 9"
won = false

while (!won) 
  user_input = gets.chomp.to_i

  if (user_input == answer)
    puts "You win!"
    won = true
  elsif (user_input > answer)
    puts "Too high!"
  else 
    puts "Too low!"
  end
end
