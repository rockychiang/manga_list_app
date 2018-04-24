require 'rails_helper'

RSpec.describe Publisher, type: :model do

  let(:oda) {
    Author.create(name: "Oda, Eiichiro")
  }

  let(:watsuki) {
    Author.create(name: "Watsuki, Nobuhiro")
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

  let(:kenshin) {
    Manga.create(
      title: "Rurouni Kenshin",
      status: "Finished",
      volumes: 28,
      chapters: 259,
      author_id: watsuki.id,
      publisher_id: jump.id,
      start_date: 1994-04-12,
      end_date: 1999-09-21
    )
  }

end
