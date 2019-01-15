module MoviesHelper
	def format_price(movie)
		if movie.free?
			return content_tag(:strong, "Free !!!")
		end
		number_to_currency(movie.price, unit: "Rs ") 
	end
end
