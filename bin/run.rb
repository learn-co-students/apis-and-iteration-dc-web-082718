#!/usr/bin/env ruby

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

welcome
character = get_character_from_user
user_choice = convert_choice_to_key
# show_character_movies("Luke Skywalker")
show_character_stats(character, user_choice)
