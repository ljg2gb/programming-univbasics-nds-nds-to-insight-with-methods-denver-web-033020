require 'pp'
require 'pry'
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'directors_database'

#pp directors_database

#Find a way to accumulate the :worldwide_grosses and return that Integer
#using director_data as input

def gross_for_director(directors_database)
 #binding.pry
  total_value_for_director = 0
  director_index = 0
  while director_index < directors_database[director_index].length do
    
    movies_index = 0
    movies_len = directors_database[director_index][:movies].length
    while movies_index < movies_len do
      total_value_for_director += directors_database[director_index][:movies][movies_index][:worldwide_gross]
      movies_index += 1
    end
    director_index += 1
  end
  return total_value_for_director
end


# Write a method that, given an NDS creates a new Hash
# The return value should be like:
#
# { directorOne => allTheMoneyTheyMade, ... }
def directors_totals(nds)
  result = {}
  director_index = 0
  while director_index < nds[director_index].length do
    director_name = nds[director_index][:name]
    result[director_name] = gross_for_director(directors_database)
    director_index += 1
  end
  return result
end
