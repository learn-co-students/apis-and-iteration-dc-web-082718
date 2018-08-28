require 'rest-client'
require 'json'
require 'pry'

def get_response(url)
  response_string = RestClient.get(url)
  response_hash = JSON.parse(response_string)
end

def get_character_movies_from_api(character)
  #make the web request
  response_hash = get_response('http://www.swapi.co/api/people/')
  # NOTE: in this demonstration we name many of the variables _hash or _array.
  # This is done for educational purposes. This is not typically done in code.


  # iterate over the response hash to find the collection of `films` for the given
  #   `character`

  response_hash["results"].each do |result|
    if result["name"].downcase == character
      return result["films"]
    end
  end
end

  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
def parse_character_movies(films_array)
  films_array.collect do |film_url|
    response_hash = get_response(film_url)
    response_hash["title"]
  end
end

  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.


def print_movies(title_array)
  # some iteration magic and puts out the movies in a nice list
  title_array.each.with_index do |title, index|
    puts "#{index + 1}. #{title}\n"
    puts"*****************\n"
  end
end

def show_character_movies(character)
  films_array = get_character_movies_from_api(character)
  title_array = parse_character_movies(films_array)
  # binding.pry
  print_movies(title_array)
end


## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
