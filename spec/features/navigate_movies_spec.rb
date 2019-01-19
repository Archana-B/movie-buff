require "rails_helper"
require "spec_helper"

describe "Navigate Movies" do
	it "allows navigation from individual show page back to index page" do 
		movie1 = Movie.create(movie_attributes(price: 10.00))

		visit movie_url(movie1)

		click_link "Back to All Shows"

		expect(current_path).to eq(movies_path)
	end

	it "allows navigation from index page to individual show page" do 
		movie1 = Movie.create(movie_attributes(price: 10.00))

		visit movies_url

		click_link "Movie 1"

		expect(current_path).to eq(movie_path(movie1))
	end
end