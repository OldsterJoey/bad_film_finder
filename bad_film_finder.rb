 # INPUTS: Menu Choice, Yes or No Choice
 # Hash within hash for movie genre and movie type
 # OUTPUTS: Movie title w/ description, Menu (tty-prompt), prompt to exit app

require "tty-prompt"

#Below is my hash that stores all hardcoded films I hand selected
 movies = {
    :horror => {:laugh => ["Leprachaun 5: In the Hood"], :cringe => ["The Happening"], :embarrass => ["Howling II"], :boredom => ["Birdemic"]}, 
    :comedy => {:laugh => ["Food Fight"], :cringe => ["Jack and Jill"], :embarrass => ["Freddy Got Fingered"], :boredom => ["Date Movie"]}, 
    :drama => {:laugh => ["The Room"], :cringe => ["Gigli"], :embarrass => ["Cats"], :boredom => ["Mulan"]}, 
    :action => {:laugh => ["Battlefield Earth"], :cringe => ["Batman and Robin"], :embarrass => ["Catwoman"], :boredom => ["Godzilla"]}, 
    :adventure => {:laugh => ["Baby Geniuses"], :cringe => ["Super Mario Bros"], :embarrass => ["Garfield: A Tail of Two Kitties"], :boredom => ["The Last Airbender"]},
   }

#This is the beginning of my questionairre using the tty-prompt Gem
prompt = TTY::Prompt.new

init_question = prompt.yes?("Do you want to watch a terrible film?")

if init_question == false
    puts "Sorry, you've come to the wrong place!"
    exit
end

fav_genre = prompt.select("Great to hear! What's your (least) favourite genre?", %w(Horror Comedy Drama Action Adventure))

fav_type = prompt.select("Finally, what do you want your cinematic experience to be?", %w(Laugh Cringe Embarrass Sleep)) #Gotta figure out how to make these array arguments into a sentence

#This is where the app accesses the films dependent on the user input. It is extremely ugly, but it works
if fav_genre == "Horror" && fav_type == "Laugh"
    puts movies[:horror][:laugh][0]
elsif fav_genre == "Horror" && fav_type == "Cringe"
    puts movies[:horror][:cringe][0]
elsif fav_genre == "Horror" && fav_type == "Embarrass"
    puts movies[:horror][:embarrass][0]
elsif fav_genre == "Horror" && fav_type == "Sleep"
    puts movies[:horror][:boredom][0]
elsif fav_genre == "Comedy" && fav_type == "Laugh"
        puts movies[:comedy][:laugh][0]
elsif fav_genre == "Comedy" && fav_type == "Cringe"
        puts movies[:comedy][:cringe][0]
elsif fav_genre == "Comedy" && fav_type == "Embarrass"
        puts movies[:comedy][:embarrass][0]
elsif fav_genre == "Comedy" && fav_type == "Sleep"
        puts movies[:comedy][:boredom][0]
elsif fav_genre == "Drama" && fav_type == "Laugh"
        puts movies[:drama][:laugh][0]
elsif fav_genre == "Drama" && fav_type == "Cringe"
        puts movies[:drama][:cringe][0]
elsif fav_genre == "Drama" && fav_type == "Embarrass"
        puts movies[:drama][:embarrass][0]
elsif fav_genre == "Drama" && fav_type == "Sleep"
        puts movies[:drama][:boredom][0]
    elsif fav_genre == "Action" && fav_type == "Laugh"
        puts movies[:action][:laugh][0]
elsif fav_genre == "Action" && fav_type == "Cringe"
        puts movies[:action][:cringe][0]
elsif fav_genre == "Action" && fav_type == "Embarrass"
        puts movies[:action][:embarrass][0]
elsif fav_genre == "Action" && fav_type == "Sleep"
        puts movies[:action][:boredom][0]
    elsif fav_genre == "Adventure" && fav_type == "Laugh"
        puts movies[:adventure][:laugh][0]
elsif fav_genre == "Adventure" && fav_type == "Cringe"
        puts movies[:adventure][:cringe][0]
elsif fav_genre == "Adventure" && fav_type == "Embarrass"
        puts movies[:adventure][:embarrass][0]
elsif fav_genre == "Adventure" && fav_type == "Sleep"
        puts movies[:adventure][:boredom][0]
else
    puts "you should have found this on purpose"
end