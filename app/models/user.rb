class User < ApplicationRecord
  has_many :collections
  has_many :mangas, through: :collections
  has_secure_password
  validates :name,
    presence: true,
    uniqueness: true,
    format: {with: /\A[a-zA-Z0-9_-]+\z/, message: "can only be a combinations of letters, numbers, dash, or underscore"},
    length: {minimum: 3}
  validates :email, uniqueness: true, presence: true
  validates :password, length: {in: 6..20}

end
