 # INPUTS: Menu Choice, Yes or No Choice
 # Hash within hash for movie genre and movie type
 # OUTPUTS: Movie title w/ description, Menu (tty-prompt), prompt to exit app

require "tty-prompt"
require "rainbow"
require "lolize"
require "json"
require_relative "methods"

file = File.read("./credentials.json")
credentials = JSON.parse(file)
API_KEY = credentials["api_key"]

#Below is my hash that stores all hardcoded films I hand selected
#  movies = {
#     :horror => {:laugh => ["Leprechaun 5: In the Hood (2000)", "Wicker Man (2006)", "Troll II (1990)", "Reefer Madness", "Plan 9 from Outer Space (1959)"], :cringe => ["The Happening (2008)", "The Giant Claw (1957)"], :embarrass => ["Howling II: Your Sister Is a Werewolf (1985)"], :boredom => ["Birdemic: Shock and Terror (2010)", "Anaconda (1997)", "Deep Blue Sea (1999)"]}, 
#     :comedy => {:laugh => ["White Chicks", "Scary Movie 3"], :cringe => ["Jack and Jill (2011)", "Kazaam (1996)", "Spice World (1997)", "Pixels (2013)"], :embarrass => ["Freddy Got Fingered (2001)", "Food Fight (2012)", "Vampires Suck (2010)", "Movie 43 (2013)"], :boredom => ["Date Movie (2006)", "She's All That (1999)", "Disaster Movie (2008)"]}, 
#     :drama => {:laugh => ["The Room (2003)"], :cringe => ["Gigli (2003)", "Obsessed (2009)"], :embarrass => ["Cats (2019)", "Showgirls (1995)"], :boredom => ["You Got Served (2004)", "Max Payne (2008)"]}, 
#     :action => {:laugh => ["Battlefield Earth (2000)", "Mortal Kombat (1995)", "Bad Boys II (2003)"], :cringe => ["Batman and Robin (1997)", "Wild Wild West (1999)"], :embarrass => ["Catwoman (2004)"], :boredom => ["Godzilla (1998)", "Battleship (2012)", "Pacific Rim: Uprising (2018)"]}, 
#     :adventure => {:laugh => ["Baby Geniuses (1999)", "Masters of the Universe (1987)"], :cringe => ["Super Mario Bros (1993)", "Mac and Me (1988)"], :embarrass => ["Garfield: A Tail of Two Kitties (2006)", "Howard the Duck (1986)"], :boredom => ["The Last Airbender (2010)", "Hercules (2014)"]},
#    }

   movies = {
    :horror => {:laugh => [{title: "Leprechaun 5: In the Hood", date: "2000", movie_id: "tt0209095"}], :cringe => ["The Happening (2008)", "The Giant Claw (1957)"], :embarrass => ["Howling II: Your Sister Is a Werewolf (1985)"], :boredom => ["Birdemic: Shock and Terror (2010)", "Anaconda (1997)", "Deep Blue Sea (1999)"]}, 
    :comedy => {:laugh => ["White Chicks", "Scary Movie 3"], :cringe => ["Jack and Jill (2011)", "Kazaam (1996)", "Spice World (1997)", "Pixels (2013)"], :embarrass => ["Freddy Got Fingered (2001)", "Food Fight (2012)", "Vampires Suck (2010)", "Movie 43 (2013)"], :boredom => ["Date Movie (2006)", "She's All That (1999)", "Disaster Movie (2008)"]}, 
    :drama => {:laugh => ["The Room (2003)"], :cringe => ["Gigli (2003)", "Obsessed (2009)"], :embarrass => ["Cats (2019)", "Showgirls (1995)"], :boredom => ["You Got Served (2004)", "Max Payne (2008)"]}, 
    :action => {:laugh => ["Battlefield Earth (2000)", "Mortal Kombat (1995)", "Bad Boys II (2003)"], :cringe => ["Batman and Robin (1997)", "Wild Wild West (1999)"], :embarrass => ["Catwoman (2004)"], :boredom => ["Godzilla (1998)", "Battleship (2012)", "Pacific Rim: Uprising (2018)"]}, 
    :adventure => {:laugh => ["Baby Geniuses (1999)", "Masters of the Universe (1987)"], :cringe => ["Super Mario Bros (1993)", "Mac and Me (1988)"], :embarrass => ["Garfield: A Tail of Two Kitties (2006)", "Howard the Duck (1986)"], :boredom => ["The Last Airbender (2010)", "Hercules (2014)"]},
   }

#This is the beginning of my questionairre using the tty-prompt Gem

ascii_title

prompt = TTY::Prompt.new(active_color: :green)

while prompt
    init_question = prompt.select(Rainbow("Do you want to watch a terrible film?").underline.magenta, ["Yes", "No", "Gimme something quick!"])

    if init_question == "No"
        puts ""
        good_movie_lover
    end

    if init_question == "Gimme something quick!"
        puts ""
        random_movie
    end

    puts ""

    fav_genre = prompt.select(Rainbow("Great to hear! What's your (least) favourite genre?").underline.magenta, %w(Horror Comedy Drama Action Adventure))

    puts ""

    fav_type = prompt.select(Rainbow("Finally, what do you want your cinematic experience to be?").underline.magenta, ["I want to laugh", "Make me cringe", "I really enjoy embarrassing myself infront of all my friends and peers", "I need a nap"]) #Gotta figure out how to make these array arguments into a sentence

    if fav_type == "I want to laugh"
        fav_type = "Laugh"
    elsif fav_type == "Make me cringe"
        fav_type = "Cringe"
    elsif fav_type == "I really enjoy embarrassing myself infront of all my friends and peers"
        fav_type = "Embarrass"
    elsif fav_type == "I need a nap"
        fav_type = "Sleep"
    end

    puts ""

    puts Rainbow("So you've selected #{fav_genre} and #{fav_type}...").green.underline
    sleep 1

    puts ""

    print "You should watch "

        #This is where the app accesses the films dependent on the user input. It is extremely ugly, but it works

    movie_results = movies[fav_genre.downcase.to_sym][fav_type.downcase.to_sym].sample
    p movie_results[:title]
    movie_info = get_movie_info(movie_results[:movie_id], API_KEY)
    puts ""
    display_overview(movie_info)
    sleep 1
    
    puts ""
    
    retry_questionairre
end