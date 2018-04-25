class Manga < ApplicationRecord
  has_many :collections
  has_many :users, through: :collections
  belongs_to :author
  validates :title, presence: true
  accepts_nested_attributes_for :author

  def years_active
    started = start_date.to_s.to_date.strftime("%b %e, %Y")
    !!end_date ? ended = end_date.to_s.to_date.strftime("%b %e, %Y") : ended = "Present"
    started + " - " + ended
  end
end
