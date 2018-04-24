require 'rails_helper'

RSpec.describe Collection, :type => :model do
  let(:user) {
    User.create(
      name: "Luffy",
      email: "luffy@onepiece.com",
      password: "password"
    )
  }

  let(:oda) {
    Author.create(name: "Oda, Eiichiro")
  }

  let(:jump) {
    Publisher.create(name: "Weekly Shounen Jump")
  }

  let(:onepiece) {
    Manga.create(
      title: "One Piece",
      status: "On Going",
      author_id: oda.id,
      publisher_id: jump.id,
      start_date: 1997-07-22
    )
  }

  let(:collection) {
    Collection.create(
      user_id: user.id,
      manga_id: onepiece.id
    )
  }
end
