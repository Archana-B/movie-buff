class Movie < ApplicationRecord
	def free?
		price.nil? || price.blank? ||price.zero? 
	end

	def self.upcoming
		where("show_time >= ?", Time.now).order("show_time")
	end
end
