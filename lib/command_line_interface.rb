def welcome
  # puts out a welcome message here!
  puts 'Welcome Jedi. May the force be with you.'
  puts 'You have the high ground.'
end

def get_character_from_user
  puts "please enter a character"
  user_input = gets.chomp.downcase
  # use gets to capture the user's input. This method should return that input, downcased.
end
