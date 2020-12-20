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
  puts Rainbow('(. _ .)').red
  puts Rainbow('Not good (bad) enough for you eh? Lets find you another one!').red
  sleep 2
  puts ''
end

def load_bar
  bar = TTY::ProgressBar.new(Rainbow('Im finding you a terrible movie... [:bar]').yellow, total: 20)
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



def display_overview(info)
  puts Rainbow("Here's a description:").green.underline
  puts ''
  puts Rainbow(info['movie_results'][0]['overview']).cyan
  puts ''
  print Rainbow('this film got a review score of ').green
  print Rainbow(info['movie_results'][0]['vote_average']).cyan
  puts Rainbow(" on IMDb, but on the bad film finder, everything's a 10.0!").green
rescue NoMethodError
  puts Rainbow("Unfortunately, an error has occured and I can't seem to find any information for this movie... Maybe test your luck and watch it anyway?").red
end

# Manual Test Parameters
# movie_info = get_movie_info('tt0105643', API_KEY)
# tester:
# display_overview(movie_info)
# Should Print the information for the movie Trolls 2 Exactly as it would print within app. If this does not work there is a problem with the movie id or access to my API Key
