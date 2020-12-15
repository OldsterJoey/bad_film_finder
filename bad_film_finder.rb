 # INPUTS: Menu Choice, Yes or No Choice
 # Hash within hash for movie genre and movie type
 # OUTPUTS: 

 movies = {
     :horror => {:laugh => ["Leprachaun 5: In the Hood"], :cringe => ["The Happening"], :embarass => ["Howling II"], :boredom => ["Birdemic"]}, 
     :comedy => {:laugh => ["Food Fight"], :cringe => ["Jack and Jill"], :embarass => ["Freddy Got Fingered"], :boredom => ["Date Movie"]}, 
     :drama => {:laugh => ["The Room"], :cringe => ["Gigli"], :embarass => ["Cats"], :boredom => ["Mulan"]}, 
     :action => {:laugh => ["Battlefield Earth"], :cringe => ["Batman and Robin"], :embarass => ["Catwoman"], :boredom => ["Godzilla"]}, 
     :adventure => {:laugh => ["Baby Geniuses"], :cringe => ["Super Mario Bros"], :embarass => ["Garfield: A Tail of Two Kitties"], :boredom => ["The Last Airbender"]},
    }

    
pp movies[:horror][:laugh][1]

#attributes:
#name
#genre
#type
# class Movie
#     def initialize(name, genre, type)
#         @name = name
#         @genre = genre
#         @type = type
#     end
#     def greet
#         puts "This movies name is #{@name}"
#     end
#     def to_s
#         return "Movie: name: #{@name}, genre: #{@genre}, type: #{@type}"
#     end
# end

# movie = Movie.new("The Happening", "Horror", "cringe")
# puts movie