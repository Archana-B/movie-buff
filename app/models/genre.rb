class Genre < ApplicationRecord
    has_many :characterizations, dependent: :destroy

    has_many :movies, through: :characterizations, source: :movie
    
    validates :name, presence: true, uniqueness: true
end
