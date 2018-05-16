class MangaSerializer < ActiveModel::Serializer
  attributes :id, :title, :status, :volumes, :chapters, :start_date, :end_date
end
