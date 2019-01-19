require "spec_helper"
require "rails_helper"

describe "View list of movies" do 
	it "shows the movies list" do
		event1 = Movie.create(name: "Movie 1", description: "ok" , ratings: 9, show_time: DateTime.now, price: 10)
		event2 = Movie.create(name: "Movie 2", description: "ok" , ratings: 9, show_time: DateTime.now, price: 10)
		
		visit movies_url

		expect(page).to have_text("2 Movies")
		expect(page).to have_text(event1.name)
		expect(page).to have_text(event2.name)
	end
	
end