require "spec_helper"
require "rails_helper"

describe "View list of movies" do 
	it "shows the movies list" do
		movie1 = Movie.create(movie_attributes(price: 10.00))
		movie2 = Movie.create(movie_attributes({name: "Movie 2", price: 20.00}))
		
		visit movies_url

		expect(page).to have_text("2 Movies")
		expect(page).to have_text(movie1.name)
		expect(page).to have_text(movie1.description)
		expect(page).to have_text("Rs 10.00")


		expect(page).to have_text(movie2.name)
		expect(page).to have_text(movie2.description)
		expect(page).to have_text("Rs 20.00")
	end
	
end