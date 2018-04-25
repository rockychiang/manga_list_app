module CollectionsHelper
  def average_rating
    Collection.average(:rating)
  end
end
