require "rails_helper"
require "spec_helper"

describe "Movie Model" do
	it "is free if price is zero or nil" do

		movie = Movie.new(price: 0)
		expect(movie.free?).to eq(true)
		
		movie = Movie.new(price: nil)
		expect(movie.free?).to eq(true)

	end	

	it "is not free if price is not zero" do
		movie = Movie.new(price: 10)
		expect(movie.free?).to eq(false)
	end	
end