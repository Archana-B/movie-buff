class Movie < ApplicationRecord
	def free?
		price.zero? || price.blank? || price.nil?
	end
end
