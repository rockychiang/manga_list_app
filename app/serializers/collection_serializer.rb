class CollectionSerializer < ActiveModel::Serializer
  attributes :id, :review, :ratings, :status, :last_read
end
