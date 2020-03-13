require 'pp'
require 'pry'
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'directors_database'

pp directors_database

#Find a way to accumulate the :worldwide_grosses and return that Integer
#using director_data as input

def gross_for_director(director_data)
 #binding.pry
  total_value_for_director = 0
    
    movies_index = 0
    movies_len = director_data[:movies].length
    while movies_index < movies_len do
      total_value_for_director += director_data[:movies][movies_index][:worldwide_gross]
      movies_index += 1
    end
  return total_value_for_director
end


# Write a method that, given an NDS creates a new Hash
# The return value should be like:
#
# { directorOne => allTheMoneyTheyMade, ... }
def directors_totals(nds)
  #binding.pry
  result = {}
  director_index = 0
  while director_index < nds.length do
    director_name = nds[director_index][:name]
    #binding.pry
    result[director_name] = gross_for_director(nds[director_index])
    director_index += 1
  end
  return result
end
