class User < ApplicationRecord
  
  has_many :reviews, dependent: :destroy

  has_secure_password

  validates :name, :email, presence: true

  validates :email, format: { with: /\A\S+@\S+.com\z/, message: 'not a valid one' }, uniqueness: { case_sensitive: false }

  def self.authenticate(email, password)
    user = User.find_by(email: email)
    user && user.authenticate(password)
  end
end