require 'rest-client'
require 'json'
require 'pry'

def get_json(url) # Accepts a URL for an API page and returns JSON data.
  response_string = RestClient.get(url)
  response_hash = JSON.parse(response_string)
end

def make_film_array(array_of_api_urls)
  # Accepts an array of API_URLs and
  # returns an array of JSON data
  array_of_api_urls.map do |film_url|
    get_json(film_url)
  end
end

def get_character_movies_from_api(character)
  # Returns an array of the JSON data
  # of each film the passed character was in.

  # People is an array of hashes of data about
  # all characters with available data
  people = get_json('http://www.swapi.co/api/people/')

  api_urls = {}

  people["results"].each do |character_hash|
    if character_hash["name"].downcase == character
      api_urls = character_hash["films"]
    end
  end

  make_film_array(api_urls)

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
