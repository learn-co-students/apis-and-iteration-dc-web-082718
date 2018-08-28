require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)

  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)

  api_urls = {}

  response_hash["results"].each do |character_hash|
    if character_hash["name"].downcase == character
      api_urls = character_hash["films"]
    end
  end

  film_array = []

  api_urls.each do |film_url|
    film_string = RestClient.get(film_url)
    film_array << JSON.parse(film_string)
  end

  film_array
end

# # puts "1) *******"
#  puts get_character_movies_from_api('luke skywalker')
# puts "2) *******"
# puts get_character_movies_from_api('c-3po')
# puts "3) *******"

def print_movies(films_hash)
  # some iteration magic and puts out the movies in a nice list
  films_hash.each do |film|
    # binding.pry
    puts film["title"]
  end
end

def show_character_movies(character)
  # binding.pry
  films_array = get_character_movies_from_api(character)
  print_movies(films_array)
end
#
# show_character_movies('han solo')
# show_character_movies('c-3Po')
#show_character_movies('c-3po')
# show_character_movies('Princess Leia')

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
