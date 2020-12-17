# frozen_string_literal: true

require 'tty-prompt'
require 'tty-progressbar'
require 'rainbow'
require 'lolize'
require 'faraday'
require 'json'

file = File.read('./credentials.json')
credentials = JSON.parse(file)

API_KEY = credentials['api_key']

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
  good_movies = ['2001: A Space Odyssey (1968)', 'The Godfather (1972)', 'Citizen Kane (1941)']
  puts Rainbow("Sorry, you've come to the wrong place! May I suggest you watch #{good_movies.sample} instead?").red
  puts ''
  sleep 1
  exit
end

def retry_questionairre
  prompt = TTY::Prompt.new(active_color: :green)
  colorizer = Lolize::Colorizer.new
  retry_question = prompt.select(Rainbow('Did you want to start again?').underline.magenta, %w[Yes No])
  if retry_question == 'No'
    puts ''
    colorizer.write "Please enjoy the movie! (or don't)"
    puts ''
    sleep 1
    puts ''
    exit
  end
  puts ''
  puts Rainbow('Not good (bad) enough for you eh? Lets find you another one!').red
  sleep 2
  puts ''
end

def random_movie
  rand_movies = ['Leprechaun 5: In the Hood (2000)', 'Wicker Man (2006)', 'Troll II (1990)', 'Reefer Madness', 'Plan 9 from Outer Space (1959)', 'The Happening (2008)', 'The Giant Claw (1957)', 'Howling II: Your Sister Is a Werewolf (1985)', 'Birdemic: Shock and Terror (2010)', 'Anaconda (1997)', 'Deep Blue Sea (1999)',
                 'White Chicks', 'Scary Movie 3', 'Jack and Jill (2011)', 'Kazaam (1996)', 'Spice World (1997)', 'Pixels (2013)', 'Freddy Got Fingered (2001)', 'Food Fight (2012)', 'Vampires Suck (2010)', 'Movie 43 (2013)', 'Date Movie (2006)', "She's All That (1999)", 'Disaster Movie (2008)',
                 'The Room (2003)', 'Gigli (2003)', 'Obsessed (2009)', 'Cats (2019)', 'Showgirls (1995)', 'You Got Served (2004)', 'Max Payne (2008)', 'Battlefield Earth (2000)', 'Mortal Kombat (1995)', 'Bad Boys II (2003)', 'Batman and Robin (1997)', 'Wild Wild West (1999)', 'Catwoman (2004)',
                 'Godzilla (1998)', 'Battleship (2012)', 'Pacific Rim: Uprising (2018)', 'Baby Geniuses (1999)', 'Masters of the Universe (1987)', 'Super Mario Bros (1993)', 'Mac and Me (1988)', 'Garfield: A Tail of Two Kitties (2006)', 'Howard the Duck (1986)', 'The Last Airbender (2010)', 'Hercules (2014)']
  puts "Watch #{rand_movies.sample}"
  puts ''
  sleep 1
  exit
end

def load_bar
    bar = TTY::ProgressBar.new(Rainbow("Im finding you a terrible movie... [:bar]").yellow, total: 20)
    20.times do
    sleep(0.1)
    bar.advance(1)
    end
end

def get_movie_info(movie_id, api_key)
  url = "https://api.themoviedb.org/3/find/#{movie_id}"
  query_parameters = { api_key: api_key, language: 'en-US', external_source: 'imdb_id' }
  resp = Faraday.get(url, query_parameters, { 'Accept' => 'application/json' })
  info_hash = JSON.parse(resp.body)
  info_hash
end

movie_info = get_movie_info('tt0105643', API_KEY)

def display_overview(info)
  puts info['movie_results'][0]['overview']
end

# tester:
# display_overview(movie_info)
