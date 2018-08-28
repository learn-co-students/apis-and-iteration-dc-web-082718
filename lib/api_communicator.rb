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


  response_hash["results"].each do |result|
    if result["name"].downcase == character
      return result[option]
    end
  end
end

  # collect those stat API urls, make a web request to each URL to get the info
  # for that film
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

#passed on user choice as a key and displayed the desired set
def show_character_stats(character,user_choice)
  #retrieve stat from api
  #stat can either be a string containing stat, a URL or array of URL's
  stat = get_character_stats_from_api(character, user_choice)
  #homeworld stat is a URL
  if user_choice == "homeworld"
    #get response from homeworld URL
    response_hash = get_response(stat)
    #display the homeworld name
    puts response_hash["name"]
    puts"*****************\n"

  elsif user_choice == "films"#get response from homeworld URL
      #get response from film URL
      #get name for each film and film array
    parsed_stats = parse_character_stats(stat, "title")
    print_stats(parsed_stats)

  elsif user_choice ==  "species"
    #get response from species URL
    parsed_stats = parse_character_stats(stat, "name")
    print_stats(parsed_stats)

  else
    
    puts stat
    puts "*****************\n"
  end

end


## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
