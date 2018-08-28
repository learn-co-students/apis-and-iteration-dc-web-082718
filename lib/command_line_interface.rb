# puts out a welcome message here!
def welcome
  puts "Welcome to Star Wars API!"
end
# gets users charcter selection
def get_character_from_user
  puts "Please enter a character:"
  return  gets.chomp.downcase

end
#gets users selection for particular stat.
def get_option
  puts " What do you want to know? (Please select number):\n1: Height\n2: Mass\n3: Hair Color\n4: Skin Color\n5: Eye Color\n6: Birth Year\n7: Gender\n8: Homeworld\n9: Films\n10: Species"
  return  gets.chomp.downcase
end


#Method converts users string number selection to validate key.
def convert_choice_to_key
  case get_option
    when "1"
      return "height"
    when "2"
      return "mass"
    when "3"
      return "hair_color"
    when "4"
      return "skin_color"
    when "5"
      return "eye_color"
    when "6"
      return "birth_year"
    when "7"
      return "gender"
    when "8"
      return "homeworld"
    when "9"
      return "films"
    when "10"
      return "species"
  end
end
