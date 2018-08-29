#!/usr/bin/env ruby

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

welcome
character = get_character_from_user #character = "R2-D2"
show_character_movies(character)
# puts get_character_info(character)
# film_api_urls(character)
# print_movies(film_api_urls)
