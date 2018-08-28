require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
  binding.pry
  # NOTE: in this demonstration we name many of the variables _hash or _array.
  # This is done for educational purposes. This is not typically done in code.


  # iterate over the response hash to find the collection of `films` for the given
  #   `character'
  film_list = get_character_info(character,response_hash)
  return film_api_urls(film_list)



  # collect those film API urls, make a web request to each URL to get the info
  #  for that film

  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film


  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.
end

#got the films list from a character name
# character is "R2D2" then we get
# ["https://www.swapi.co/api/films/2/", "https://www.swapi.co/api/films/5/", "https://www.swapi.co/api/films/4/", "https://www.swapi.co/api/films/6/", "https://www.swapi.co/api/films/3/", "https://www.swapi.co/api/films/1/", "https://www.swapi.co/api/films/7/"]
def get_character_info(character,response_hash)
  #response_string = RestClient.get('http://www.swapi.co/api/people/')
  #response_hash = JSON.parse(response_string)
  response_hash["results"].each do |value|
    #/iterate over each element and check if value of the name key is equal to user input
    #binding.pry
    if value["name"].downcase == character
      return value["films"]
    end
  end
end

def film_api_urls(film_list)
  #film_list = get_character_info(character)

  # film = RestClient.get(film_list[0])
  # film_hash =  JSON.parse(film)
  # puts film_hash
  film_list.map do |api_url|
    film = RestClient.get(api_url)
    film_hash =  JSON.parse(film)
    film_hash
    # response_hash = JSON.parse(response_string)
  end

end



def print_movies(films_hash)
  # some iteration magic and puts out the movies in a nice list
  films_hash.each do |film|
    puts film["title"]
  end
end



def show_character_movies(character)
  films_array = get_character_movies_from_api(character)
  print_movies(films_array)
end


## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
