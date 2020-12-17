require "json"

class Movie
    attr_reader :name
    def initialize(name, genre, type)
        @name = name
        @genre = genre
        @type = type
    end
end



fav_genre = "Horror"
fav_type = "Cringe"

p movies[fav_genre.downcase.to_sym][fav_type.downcase.to_sym].sample

file = File.read("./credentials.json")
credentials = JSON.parse(file)
puts credentials["test"]