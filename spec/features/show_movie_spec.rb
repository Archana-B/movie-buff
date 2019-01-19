require 'rails_helper'
require 'spec_helper'

describe "Display individual movie details page" do
  it "shows the movie's details" do
    movie = Movie.create(movie_attributes(price: 25.00))

    visit movie_url(movie)

    expect(page).to have_text(movie.name)
    expect(page).to have_text(movie.ratings)
    expect(page).to have_text("Rs 25.00")
    expect(page).to have_text(movie.description)
  end
end 