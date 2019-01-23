class User < ApplicationRecord
  has_secure_password

  validates :name, :email, presence: true

  validates :email, format: { with: /\A\S+@\S+.com\z/, message: 'not a valid one' }, uniqueness: { case_sensitive: false }

end