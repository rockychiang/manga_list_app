class MangaSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :status, :volumes, :chapters, :start_date, :end_date

  def author
    AuthorSerializer.new(object.author, root: false)
  end
end
