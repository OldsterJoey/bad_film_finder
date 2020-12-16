require "tty-prompt"
require "rainbow"
require "lolize"




def ascii_title
    colorizer = Lolize::Colorizer.new
    colorizer.write "
    ███████████████████████████████████████████████████████████████████████████████████
    █▄─▄─▀██▀▄─██▄─▄▄▀███▄─▄▄─█▄─▄█▄─▄███▄─▀█▀─▄███▄─▄▄─█▄─▄█▄─▀█▄─▄█▄─▄▄▀█▄─▄▄─█▄─▄▄▀█
    ██─▄─▀██─▀─███─██─████─▄████─███─██▀██─█▄█─█████─▄████─███─█▄▀─███─██─██─▄█▀██─▄─▄█
    ▀▄▄▄▄▀▀▄▄▀▄▄▀▄▄▄▄▀▀▀▀▄▄▄▀▀▀▄▄▄▀▄▄▄▄▄▀▄▄▄▀▄▄▄▀▀▀▄▄▄▀▀▀▄▄▄▀▄▄▄▀▀▄▄▀▄▄▄▄▀▀▄▄▄▄▄▀▄▄▀▄▄▀
    
    "
end

def good_movie_lover
    good_movies = ["2001: A Space Odyssey (1968)", "The Godfather (1972)", "Citizen Kane (1941)" ]
    puts Rainbow("Sorry, you've come to the wrong place! May I suggest you watch #{good_movies.sample} instead?").red
    exit
end

def retry_questionairre
    prompt = TTY::Prompt.new(active_color: :green)
    colorizer = Lolize::Colorizer.new
    retry_question = prompt.select(Rainbow("Did you want to start again?").underline.magenta, %w(Yes No))
    if retry_question == "No"
        puts ""
        colorizer.write "Please enjoy the movie! (or don't)"
        puts ""
        sleep 1
        puts ""
        exit
    end
    puts ""
    puts Rainbow("Not good (bad) enough for you eh? Lets find you another one!").red
    sleep 2
    puts ""
end
