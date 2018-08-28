def welcome
  # puts out a welcome message here!
  puts "Welcome to Star Wars API!"
end

def get_character_from_user
  puts "please enter a character"
  return  gets.chomp.downcase

end

def get_option
  puts " What do you want to know? (Please select number)\n
  1: Height\n2: Mass\n3: Hair Color\n 4: Skin Color\n 5: Eye Color\n
  6: Birth Year\n7: Gender\n8: Homeworld\n 9: Films\n 10: Species"
  return  gets.chomp.downcase
  # use gets to capture the user's input. This method should return that input, downcased.
end
