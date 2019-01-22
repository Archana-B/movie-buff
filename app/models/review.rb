class Review < ApplicationRecord
  
  validates :name, presence: true

  validates :comment, length: {minimun: 5}

  validates :stars, inclusion: {in: 1..5, message: "must be between 1 to 5"}

  belongs_to :movie
  
end
