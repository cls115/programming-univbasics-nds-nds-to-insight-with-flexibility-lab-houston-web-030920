require 'yaml'
def directors_database
	rot13 = -> (s) { s.tr('A-Za-z', 'N-ZA-Mn-za-m') }
  @_db ||= YAML.load(rot13.call(File.open("directors_db").read.to_s))
end
require 'pp'

require 'directors_database'
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
def movies_with_director_key(name, movies_collection)



  new_arr = []



  ind = 0 
  while ind < movies_collection.length do
    movies_collection[ind][:director_name] = name
    new_arr << movies_collection[ind]
    ind += 1 
  end


  return new_arr

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
