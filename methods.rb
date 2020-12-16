require "tty-prompt"
require "rainbow"


def ascii_title
    puts Rainbow("
    ███████████████████████████████████████████████████████████████████████████████████
    █▄─▄─▀██▀▄─██▄─▄▄▀███▄─▄▄─█▄─▄█▄─▄███▄─▀█▀─▄███▄─▄▄─█▄─▄█▄─▀█▄─▄█▄─▄▄▀█▄─▄▄─█▄─▄▄▀█
    ██─▄─▀██─▀─███─██─████─▄████─███─██▀██─█▄█─█████─▄████─███─█▄▀─███─██─██─▄█▀██─▄─▄█
    ▀▄▄▄▄▀▀▄▄▀▄▄▀▄▄▄▄▀▀▀▀▄▄▄▀▀▀▄▄▄▀▄▄▄▄▄▀▄▄▄▀▄▄▄▀▀▀▄▄▄▀▀▀▄▄▄▀▄▄▄▀▀▄▄▀▄▄▄▄▀▀▄▄▄▄▄▀▄▄▀▄▄▀
    
    ").darkgreen
end

def good_movie_lover
    good_movies = ["2001: A Space Odyssey (1968)", "The Godfather (1972)", "Citizen Kane (1941)" ]
    puts Rainbow("Sorry, you've come to the wrong place! May I suggest you watch #{good_movies.sample} instead?").red
    exit
end

