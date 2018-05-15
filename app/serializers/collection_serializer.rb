class CollectionSerializer < ActiveModel::Serializer
  attributes :id, :review, :rating, :status, :last_read, :manga

  def manga
    MangaSerializer.new(object.manga, root: false)
  end
end
