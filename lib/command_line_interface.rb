def welcome
  # puts out a welcome message
  puts 'Welcome Jedi. May the force be with you.'
  puts 'You have the high ground.'
  puts 'I will give you a list of movies that a character starred in.'
end

def get_character_from_user
  puts "Please enter a character:"
  user_input = gets.chomp.downcase
  # Captures the user's input and returns that input, downcased.
end
