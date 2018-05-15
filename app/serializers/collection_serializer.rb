class CollectionSerializer < ActiveModel::Serializer
  attributes :id, :review, :rating, :status, :last_read
  belongs_to :manga
end
