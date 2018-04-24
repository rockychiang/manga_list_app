require 'rails_helper'

RSpec.describe Author, type: :model do

  let(:oda) {
    Author.create(name: "Oda, Eiichiro")
  }

  let(:wanted) {
    Manga.create(
      title: "Wanted!",
      status: "Finished",
      volumes: 1,
      chapters: 5,
      author_id: oda.id,
      start_date: 19960910,
      end_date: 19960910
    )
  }

  let(:onepiece) {
    Manga.create(
      title: "One Piece",
      status: "On Going",
      author_id: oda.id,
      start_date: 19970722
    )
  }

    it "is valid with a name" do
      expect(oda).to be_valid
    end

    it "has many manga" do
      expect(oda.mangas.first).to eq(wanted)
      expect(oda.mangas.last).to eq(onepiece)
    end

end
