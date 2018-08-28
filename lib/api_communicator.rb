require 'rest-client'
require 'json'
require 'pry'

def get_response(url)
  response_string = RestClient.get(url)
  response_hash = JSON.parse(response_string)
end

def get_character_stats_from_api(character, option)
  #make the web request
  response_hash = get_response('http://www.swapi.co/api/people/')
  # NOTE: in this demonstration we name many of the variables _hash or _array.
  # This is done for educational purposes. This is not typically done in code.


  # iterate over the response hash to find the collection of `films` for the given
  #   `character`

  response_hash["results"].each do |result|
    if result["name"].downcase == character
      return result[option]

    end
  end
end

  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
def parse_character_stats(stats_array, key)
  stats_array.collect do |url|
    response_hash = get_response(url)
    response_hash[key]
  end
end

  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_stats`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of stats by title. play around with puts out other info about a given film.


def print_stats(title_array)
  # some iteration magic and puts out the movies in a nice list
  title_array.each do |title|
    puts "#{title}\n"
    puts"*****************\n"
  end
end

def show_character_stats(character,user_choice)
  if user_choice == "homeworld"
    stat = get_character_stats_from_api(character, user_choice)
    response_hash = get_response(stat)
    puts response_hash["name"]
    puts"*****************\n"

  elsif user_choice == "films"
    stat = get_character_stats_from_api(character, user_choice)
    parsed_stats = parse_character_stats(stat, "title")
    print_stats(parsed_stats)

  elsif user_choice ==  "species"
    stat = get_character_stats_from_api(character, user_choice)
    parsed_stats = parse_character_stats(stat, "name")
    print_stats(parsed_stats)

  else
    stat = get_character_stats_from_api(character, user_choice)
    puts stat
    puts "*****************\n"
  end
  stat = get_character_stats_from_api(character, user_choice)
  # title_array = parse_character_movies(films_array)
  # print_movies(title_array)
end

def convert_choice_to_key
  case get_option
  when "1" #Height
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

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
