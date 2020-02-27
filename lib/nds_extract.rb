require 'yaml'
def directors_database
	rot13 = -> (s) { s.tr('A-Za-z', 'N-ZA-Mn-za-m') }
  @_db ||= YAML.load(rot13.call(File.open("directors_db").read.to_s))
end
require 'pp'

 57  lib/nds_extract.rb 
# Provided, don't edit
require 'directors_database'
# A method we're giving you. This "flattens"  Arrays of Arrays so: [[1,2],
# [3,4,5], [6]] => [1,2,3,4,5,6].
def flatten_a_o_a(aoa)
  result = []
  i = 0
  while i < aoa.length do
    k = 0
    while k < aoa[i].length do
      result << aoa[i][k]
      k += 1
    end
    i += 1
  end
  result
end
def movie_with_director_name(director_name, movie_data)
  { 
    :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => director_name
  }
end
# Your code after this point
def movies_with_director_key(name, movies_collection)
  # GOAL: For each Hash in an Array (movies_collection), provide a collection
  # of movies and a directors name to the movie_with_director_name method
  # and accumulate the returned Array of movies into a new Array that's
  # returned by this method.
  #
  # INPUT:
  # * name: A director's name
  # * movies_collection: An Array of Hashes where each Hash represents a movie


  new_arr = []



  ind = 0 
  while ind < movies_collection.length do
    movies_collection[ind][:director_name] = name
    new_arr << movies_collection[ind]
    ind += 1 
  end


  return new_arr



  #
  # RETURN:
  #
  #
  # Hash whose keys are the studio names and whose values are the sum
  # total of all the worldwide_gross numbers for every movie in the input Hash


  result = {} 

  i = 0 
  while i < collection.length do 
    studio_name = collection[i][:studio]
    gross = collection[i][:worldwide_gross]


    if !result[studio_name] 
      result[studio_name] = gross 
    else
    result[studio_name] += gross 
    end


    i += 1 
    end

     result 





end

def movies_with_directors_set(source)
  # Array of Arrays containing all of a director's movies. Each movie will need
  # to have a :director_name key added to it.

  arr = []
  i = 0 
  while i < source.length do
    director_name = source[i][:name]
    movie_set = source[i][:movies]
    arr << movies_with_director_key(director_name, movie_set)
    i += 1 
  end

  return arr


end
