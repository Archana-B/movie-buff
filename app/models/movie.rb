class Movie < ApplicationRecord
	has_many :reviews, dependent: :destroy

	has_many :favorites, dependent: :destroy

	has_many :fans, through: :favorites, source: :user

	validates :name, :price, :capacity, presence: true

	validates :description, length: { minimum: 20 }

	validates :price, numericality: { greater_than_or_equal_to: 0 }

	validates :capacity, numericality: { only_integer: true }

	validates :image_file_name, allow_blank: true, format: {
 		with:    /\w+\.(gif|jpg|png)\z/i,
  		message: "must be a GIF, JPG, or PNG image"
	}

	def free?
		price.nil? || price.blank? ||price.zero? 
	end

	def self.upcoming
		where("show_time >= ?", Time.now).order("show_time")
	end

	def average_stars
		if reviews.any?
			return reviews.average(:stars).round(2)
		end
		return 0
	end
end
