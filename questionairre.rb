class Movie
    attr_reader :name
    def initialize(name, genre, type)
        @name = name
        @genre = genre
        @type = type
    end
end