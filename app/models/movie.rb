class Movie < ApplicationRecord

	RATINGS = 1..5
	
	validates :name, :price, :capacity, :ratings, presence: true

	validates :description, length: { minimum: 20 }

	validates :price, numericality: { greater_than_or_equal_to: 0 }

	validates :capacity, numericality: { only_integer: true }

	validates :image_file_name, allow_blank: true, format: {
 		with:    /\w+\.(gif|jpg|png)\z/i,
  		message: "must be a GIF, JPG, or PNG image"
	}

	validates :ratings, inclusion: {in: 1..5}

	has_many :reviews, dependent: :destroy

	def free?
		price.nil? || price.blank? ||price.zero? 
	end

	def self.upcoming
		where("show_time >= ?", Time.now).order("show_time")
	end
end
