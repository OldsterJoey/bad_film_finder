require_relative '../questionairre'
require_relative '../methods'

describe Movie do
    it 'should return the information of the movie' do
        name = "Plan 9 From Outer Space"
        genre = "Horror"
        type = "Laugh"
        movie = Movie.new(name,genre,type)
        expect(movie.name).to eq(name)
    end
end

