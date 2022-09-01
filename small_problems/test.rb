def take_multiple_guesses(range, &my_number)
  guesses = []
  3.times { guesses << range.to_a.sample }
  
  # recall that we currently have the Proc my_number
  # but the any? method expects a block
  # convert the Proc to a block by passing as argument with &
  if guesses.any?(my_number)
    puts "#{guesses} includes your number!"
  else
    puts "Aw, #{guesses} does not include your number."
  end
end

take_multiple_guesses (5..6) { |g| g == 5 }
# 5, 5, 7 includes your number!