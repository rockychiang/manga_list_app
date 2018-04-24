class User < ApplicationRecord
  has_many :collections
  has_many :mangas, through: :collections
  has_secure_password
  validates :name, presence: true
  validates :email, uniqueness: true, presence: true
  validates :password, length: {in: 6..20}

end
