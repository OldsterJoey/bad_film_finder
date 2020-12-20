require_relative '../methods'

describe 'good_movie_lover' do
    good_movies = ['2001: A Space Odyssey (1968)', 'The Godfather (1972)', 'Citizen Kane (1941)']
    it 'Give a value to the good_movies variable' do
        expect(good_movies).to be_truthy
    end
end