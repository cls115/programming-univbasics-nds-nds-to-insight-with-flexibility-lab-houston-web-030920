GOAL: For each Hash in an Array (movies_collection), provide a collection
  of movies and a directors name to the movie_with_director_name method
  and accumulate the returned Array of movies into a new Array that's
  returned by this method.

  INPUT:
  * name: A director's name
  * movies_collection: An Array of Hashes where each Hash represents a movie

  RETURN:

  Array of Hashes where each Hash represents a movie; however, they should all have a
  :director_name key. This addition can be done by using the provided
  movie_with_director_name method



 GOAL: Given an Array of Hashes where each Hash represents a movie,
  return a Hash that includes the total worldwide_gross of all the movies from
  each studio.

  INPUT:
  * collection: Array of Hashes where each Hash where each Hash represents a movie

  RETURN:

  Hash whose keys are the studio names and whose values are the sum
  total of all the worldwide_gross numbers for every movie in the input Hash





   GOAL: For each director, find their :movies Array and stick it in a new Array

  INPUT:
  * source: An Array of Hashes containing director information including
  :name and :movies

  RETURN:

  Array of Arrays containing all of a director's movies. Each movie will need
  to have a :director_name key added to it.










 80  lib/nds_extract.rb 
@@ -1,6 +1,6 @@
# Provided, don't edit
require 'directors_database'

require 'pry'
# A method we're giving you. This "flattens"  Arrays of Arrays so: [[1,2],
# [3,4,5], [6]] => [1,2,3,4,5,6].

@@ -28,55 +28,61 @@ def movie_with_director_name(director_name, movie_data)
    :studio => movie_data[:studio],
    :director_name => director_name
  }
  #Changes an individual movie hash by adding a directors name as a key. 
  # Takes one movie hash and takes directors name 
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
  #
  # RETURN:
  #
  # Array of Hashes where each Hash represents a movie; however, they should all have a
  # :director_name key. This addition can be done by using the provided
  # movie_with_director_name method
end

new_array = []

 counter = 0 
 while counter < movies_collection.length do 
   array_info = movie_with_director_name(name, movies_collection[counter])
   new_array << array_info
counter += 1
end
return new_array
end
# Array of movie hashes for one director, where each hash has the director_name key added to it. 
# 

def gross_per_studio(collection)
  # GOAL: Given an Array of Hashes where each Hash represents a movie,
  # return a Hash that includes the total worldwide_gross of all the movies from
  # each studio.
  #
  # INPUT:
  # * collection: Array of Hashes where each Hash where each Hash represents a movie
  #
  # RETURN:
  #
  # Hash whose keys are the studio names and whose values are the sum
  # total of all the worldwide_gross numbers for every movie in the input Hash
  new_hash = {}
  counter = 0 
  while counter < collection.length do 
  studio_name = collection[counter][:studio]
  ww_gross = collection[counter][:worldwide_gross]
  if !new_hash[studio_name]
    new_hash[studio_name] = ww_gross
  else 
    new_hash[studio_name] += ww_gross
  end 
  counter += 1 
end
return new_hash
end

def movies_with_directors_set(source)
  # GOAL: For each director, find their :movies Array and stick it in a new Array
  #
  # INPUT:
  # * source: An Array of Hashes containing director information including
  # :name and :movies
  #
  # RETURN:
  #
  # Array of Arrays containing all of a director's movies. Each movie will need
  # to have a :director_name key added to it.

newer_array = []
counter = 0 
while counter < source.length do 

newer_array << movies_with_director_key(source[counter][:name], source[counter][:movies])
# binding.pry
counter += 1 
end
return newer_array
end
# We want to call the movies_with_director_key for each director, rather than just one. And then return an array of each directors movies arrays. 
# We want the movies_with_director_key new_array to be pushed into a newer array, and be done for each director and their movies. 




# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
 63  solution 
@@ -0,0 +1,63 @@
[     ```this is an array with many hashes inside
  { 
    :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => director_name
  },
    { 
    :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => director_name
  },
    { 
    :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => director_name
  },
  .... ....  .... ....,
    { 
    :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => director_name
  }
  ]


  [
      {
        :director_name => "Byron Poodle"
        :worldwide_gross => 2,
        :release_year => 2014,
        :studio => "Karbit Poodles",
        :title => "The Fire Hydrant of Doom"
      }, 
      {
        :director_name => "Byron Poodle"
        :worldwide_gross => 2,
        :release_year => 2014,
        :studio => "Karbit Poodles",
        :title => "The Fire Hydrant of Doom"
      }, 
      {
        :director_name => "Byron Poodle"
        :worldwide_gross => 2,
        :release_year => 2014,
        :studio => "Karbit Poodles",
        :title => "The Fire Hydrant of Doom"
      }, 
      {
        :director_name => "Byron Poodle"
        :worldwide_gross => 2,
        :release_year => 2014,
        :studio => "Karbit Poodles",
        :title => "The Fire Hydrant of Doom"
      }, 
    end