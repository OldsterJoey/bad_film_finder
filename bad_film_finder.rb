# frozen_string_literal: true

# INPUTS: Menu Choice, Yes or No Choice
# Hash within hash for movie genre and movie type
# OUTPUTS: Movie title w/ description, Menu (tty-prompt), prompt to exit app

require 'tty-prompt'
require 'rainbow'
require 'lolize'
require 'json'
require_relative 'methods'

# Below is my hash that stores all hardcoded films I hand selected

movies = {
  horror: { laugh: [{ title: 'Leprechaun 5: In the Hood', date: '2000', movie_id: 'tt0209095' }, { title: 'Wicker Man (2006)', date: '2006', movie_id: 'tt0450345' }, { title: 'Troll II', date: '1990', movie_id: 'tt0105643' }, { title: 'Reefer Madness', date: '1936', movie_id: 'tt0028346' }, { title: 'Plan 9 from Outer Space', date: '1959', movie_id: 'tt0052077' }],
            cringe: [{ title: 'The Happening', date: '2008', movie_id: 'tt0949731' }, { title: 'The Giant Claw', date: '1957', movie_id: 'tt0050432' }],
            embarrass: [{ title: 'Howling II: Your Sister Is a Werewolf', date: '1985', movie_id: 'tt0089308' }],
            boredom: [{ title: 'Birdemic: Shock and Terror', date: '2010', movie_id: 'tt1316037' }, { title: 'Anaconda', date: '1997', movie_id: 'tt0118615' }, { title: 'Deep Blue Sea', date: '1999', movie_id: 'tt0149261' }] },
  comedy: { laugh: [{ title: 'White Chicks', date: '2004', movie_id: 'tt0381707' }, { title: 'Scary Movie 3', date: '2003', movie_id: 'tt0306047' }],
            cringe: [{ title: 'Jack and Jill', date: '2011', movie_id: 'tt0810913' }, { title: 'Kazaam', date: '1996', movie_id: 'tt0116756' }, { title: 'Spice World', date: '1997', movie_id: 'tt0120185' }, { title: 'Pixels', date: '2013', movie_id: 'tt2120120' }],
            embarrass: [{ title: 'Freddy Got Fingered', date: '2001', movie_id: 'tt0240515' }, { title: 'Foodfight!', date: '2012', movie_id: 'tt0249516' }, { title: 'Vampires Suck', date: '2010', movie_id: 'tt1666186' }, { title: 'Movie 43', date: '2013', movie_id: 'tt1333125' }, { title: 'Dirty Grandpa', date: '2016', movie_id: 'tt1860213' }],
            boredom: [{ title: 'Date Movie', date: '2006', movie_id: 'tt0466342' }, { title: "She's All That", date: '1999', movie_id: 'tt0160862' }, { title: 'Disaster Movie', date: '2008', movie_id: 'tt1213644' }] },
  drama: { laugh: [{ title: 'The Room', date: '2003', movie_id: 'tt0368226' }],
           cringe: [{ title: 'Gigli', date: '2003', movie_id: 'tt0299930' }, { title: 'Obsessed', date: '2000', movie_id: 'tt1198138' }],
           embarrass: [{ title: 'Cats', date: '2019', movie_id: 'tt5697572' }, { title: 'Showgirls', date: '1995', movie_id: 'tt0114436' }],
           boredom: [{ title: 'You Got Served', date: '2004', movie_id: 'tt0365957' }, { title: 'Max Payne', date: '2008', movie_id: 'tt0467197' }] },
  action: { laugh: [{ title: 'Battlefield Earth', date: '2000', movie_id: 'tt0185183' }, { title: 'Mortal Kombat', date: '1995', movie_id: 'tt0113855' }, { title: 'Bad Boys II', date: '2003', movie_id: 'tt0172156' }],
            cringe: [{ title: 'Batman and Robin', date: '1997', movie_id: 'tt0118688' }, { title: 'Wild Wild West', date: '1999', movie_id: 'tt0120891' }],
            embarrass: [{ title: 'Catwoman', date: '2004', movie_id: 'tt0327554' }],
            boredom: [{ title: 'Godzilla', date: '1998', movie_id: 'tt0120685' }, { title: 'Battleship', date: '2012', movie_id: 'tt1440129' }, { title: 'Pacific Rim: Uprising', date: '2018', movie_id: 'tt2557478' }] },
  adventure: { laugh: [{ title: 'Baby Geniuses', date: '1999', movie_id: 'tt0118665' }, { title: 'Masters of the Universe', date: '1987', movie_id: 'tt0093507' }],
               cringe: [{ title: 'Super Mario Bros', date: '1993', movie_id: 'tt0108255' }, { title: 'Mac and Me', date: '1988', movie_id: 'tt0095560' }],
               embarrass: [{ title: 'Garfield: A Tail of Two Kitties', date: '2006', movie_id: 'tt0455499' }, { title: 'Howard the Duck', date: '1986', movie_id: 'tt0091225' }],
               boredom: [{ title: 'The Last Airbender', date: '2010', movie_id: 'tt0938283' }, { title: 'Hercules', date: '2014', movie_id: 'tt1267297' }] }
}

# This is the beginning of my questionairre using the tty-prompt Gem

ascii_title

prompt = TTY::Prompt.new(active_color: :green)

while prompt
  init_question = prompt.select(Rainbow('Do you want to watch a terrible film?').underline.magenta, ['Yes', 'No', 'Gimme something quick!'])

  if init_question == 'No'
    puts ''
    good_movie_lover
  elsif init_question == 'Gimme something quick!'
    puts ''
    fav_genre = %w[horror comedy drama action adventure].sample
    fav_type = %w[laugh cringe embarrass boredom].sample
    print Rainbow('You should watch ').green

    movie_results = movies[fav_genre.downcase.to_sym][fav_type.downcase.to_sym].sample
    puts Rainbow(movie_results[:title]).cyan
    movie_info = get_movie_info(movie_results[:movie_id], API_KEY)
    puts ''
    display_overview(movie_info)
    sleep 1

    puts ''
    return
  end

  puts ''
  puts Rainbow('(^ ᴗ ^)').green
  fav_genre = prompt.select(Rainbow("Great to hear! What's your (least) favourite genre?").underline.magenta, %w[Horror Comedy Drama Action Adventure])

  puts ''
  puts Rainbow('\(- o -)/').green
  fav_type = prompt.select(Rainbow('Finally, what do you want your cinematic experience to be?').underline.magenta, ['I want to laugh', 'Make me cringe', 'I really enjoy embarrassing myself infront of all my friends and peers', 'I need a nap']) # Gotta figure out how to make these array arguments into a sentence

  if fav_type == 'I want to laugh'
    fav_type = 'Laugh'
  elsif fav_type == 'Make me cringe'
    fav_type = 'Cringe'
  elsif fav_type == 'I really enjoy embarrassing myself infront of all my friends and peers'
    fav_type = 'Embarrass'
  elsif fav_type == 'I need a nap'
    fav_type = 'Boredom'
  end

  puts ''

  puts Rainbow("So you've selected #{fav_genre} and #{fav_type}...").green.underline
  puts ''
  puts Rainbow('((> _ <))').yellow
  load_bar

  puts ''

  print Rainbow('You should watch ').green

  movie_results = movies[fav_genre.downcase.to_sym][fav_type.downcase.to_sym].sample
  puts Rainbow(movie_results[:title]).cyan
  movie_info = get_movie_info(movie_results[:movie_id], API_KEY)
  puts ''
  display_overview(movie_info)
  sleep 1

  puts ''

  retry_questionairre
end
