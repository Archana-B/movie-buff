class Review < ApplicationRecord

  STARS = 1..5
  
  validates :comment, length: {minimum: 5}

  validates :stars, inclusion: {in: 1..5, message: "must be between 1 to 5"}

  belongs_to :movie

  belongs_to :user

end
