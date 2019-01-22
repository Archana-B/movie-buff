module MoviesHelper
	def format_price(movie)
		if movie.free?
			return content_tag(:strong, "Free !!!")
		end
		number_to_currency(movie.price, unit: "Rs ") 
	end

	def image_for(movie)
		if not movie.image_file_name == ""
			return image_tag movie.image_file_name
		end
		return image_tag "placeholder.png"
	end
end
