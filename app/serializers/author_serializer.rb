class AuthorSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :mangas
end
