 # INPUTS: Menu Choice, Yes or No Choice
 # Hash within hash for movie genre and movie type
 # OUTPUTS: Movie title w/ description, Menu (tty-prompt), prompt to exit app

require "tty-prompt"
require_relative "questionairre" #cannot figure out why this relative path containing my hash is unavailable. Will keep it in main app page until sorted out
require_relative "methods"

#Below is my hash that stores all hardcoded films I hand selected
 movies = {
    :horror => {:laugh => ["Leprachaun 5: In the Hood", "Wicker Man"], :cringe => ["The Happening"], :embarrass => ["Howling II"], :boredom => ["Birdemic"]}, 
    :comedy => {:laugh => ["Food Fight"], :cringe => ["Jack and Jill"], :embarrass => ["Freddy Got Fingered"], :boredom => ["Date Movie"]}, 
    :drama => {:laugh => ["The Room"], :cringe => ["Gigli"], :embarrass => ["Cats"], :boredom => ["Mulan"]}, 
    :action => {:laugh => ["Battlefield Earth"], :cringe => ["Batman and Robin"], :embarrass => ["Catwoman"], :boredom => ["Godzilla"]}, 
    :adventure => {:laugh => ["Baby Geniuses"], :cringe => ["Super Mario Bros"], :embarrass => ["Garfield: A Tail of Two Kitties"], :boredom => ["The Last Airbender"]},
   }

#This is the beginning of my questionairre using the tty-prompt Gem
prompt = TTY::Prompt.new

ascii_title

init_question = prompt.yes?("Do you want to watch a terrible film?")

if init_question == false
    puts "Sorry, you've come to the wrong place!"
    exit
end

fav_genre = prompt.select("Great to hear! What's your (least) favourite genre?", %w(Horror Comedy Drama Action Adventure))

fav_type = prompt.select("Finally, what do you want your cinematic experience to be?", ["I want to laugh", "Make me cringe", "I really enjoy embarrassing myself infront of all my friends and peers", "I need a nap"]) #Gotta figure out how to make these array arguments into a sentence

if fav_type == "I want to laugh"
    fav_type = "Laugh"
elsif fav_type == "Make me cringe"
     fav_type = "Cringe"
elsif fav_type == "I really enjoy embarrassing myself infront of all my friends and peers"
    fav_type = "Embarrass"
elsif fav_type == "I need a nap"
    fav_type = "Sleep"
end
    
#This is where the app accesses the films dependent on the user input. It is extremely ugly, but it works
if fav_genre == "Horror" && fav_type == "Laugh"
    puts movies[:horror][:laugh].sample
elsif fav_genre == "Horror" && fav_type == "Cringe"
    puts movies[:horror][:cringe].sample
elsif fav_genre == "Horror" && fav_type == "Embarrass"
    puts movies[:horror][:embarrass].sample
elsif fav_genre == "Horror" && fav_type == "Sleep"
    puts movies[:horror][:boredom].sample
elsif fav_genre == "Comedy" && fav_type == "Laugh"
        puts movies[:comedy][:laugh].sample
elsif fav_genre == "Comedy" && fav_type == "Cringe"
        puts movies[:comedy][:cringe].sample
elsif fav_genre == "Comedy" && fav_type == "Embarrass"
        puts movies[:comedy][:embarrass].sample
elsif fav_genre == "Comedy" && fav_type == "Sleep"
        puts movies[:comedy][:boredom].sample
elsif fav_genre == "Drama" && fav_type == "Laugh"
        puts movies[:drama][:laugh].sample
elsif fav_genre == "Drama" && fav_type == "Cringe"
        puts movies[:drama][:cringe].sample
elsif fav_genre == "Drama" && fav_type == "Embarrass"
        puts movies[:drama][:embarrass].sample
elsif fav_genre == "Drama" && fav_type == "Sleep"
        puts movies[:drama][:boredom].sample
elsif fav_genre == "Action" && fav_type == "Laugh"
        puts movies[:action][:laugh].sample
elsif fav_genre == "Action" && fav_type == "Cringe"
        puts movies[:action][:cringe].sample
elsif fav_genre == "Action" && fav_type == "Embarrass"
        puts movies[:action][:embarrass].sample
elsif fav_genre == "Action" && fav_type == "Sleep"
        puts movies[:action][:boredom].sample
elsif fav_genre == "Adventure" && fav_type == "Laugh"
        puts movies[:adventure][:laugh].sample
elsif fav_genre == "Adventure" && fav_type == "Cringe"
        puts movies[:adventure][:cringe].sample
elsif fav_genre == "Adventure" && fav_type == "Embarrass"
        puts movies[:adventure][:embarrass].sample
elsif fav_genre == "Adventure" && fav_type == "Sleep"
        puts movies[:adventure][:boredom].sample
else
    puts "you should have found this on purpose"
end