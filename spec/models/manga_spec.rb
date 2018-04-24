require 'rails_helper'

RSpec.describe Manga, :type => :model do
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

  let(:watsuki) {
    Author.create(name: "Watsuki, Nobuhiro")
  }

  let(:onepiece) {
    Manga.create(
      title: "One Piece",
      status: "On Going",
      author_id: oda.id,
      start_date: 1997-07-22
    )
  }

  let(:kenshin) {
    Manga.create(
      title: "Rurouni Kenshin",
      status: "Finished",
      volumes: 28,
      chapters: 259,
      author_id: watsuki.id,
      start_date: 1994-04-12,
      end_date: 1999-09-21
    )
  }

  let(:collection) {
    Collection.create(
      user_id: user.id,
      manga_id: onepiece.id
    )
  }

end
