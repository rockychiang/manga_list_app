module CollectionsHelper
  def average_rating(manga)
    Collection.where(manga_id: manga.id).average(:rating)
  end
end
