require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) {
    User.create(
      name: "Luffy",
      email: "luffy@onepiece.com",
      password: "password"
    )
  }

  let(:admin) {
    User.create(
      name: "Nami",
      email: "admin@manga.com",
      password: "password",
      admin: true
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
      start_date: 19970722
    )
  }

  let(:kenshin) {
    Manga.create(
      title: "Rurouni Kenshin",
      status: "Finished",
      volumes: 28,
      chapters: 259,
      author_id: watsuki.id,
      start_date: 19940412,
      end_date: 19990921
    )
  }

    it "is valid with a name, email, and password" do
      expect(user).to be_valid
    end

    it "is not valid without a password" do
      expect(User.new(name: "Name")).not_to be_valid
    end

    it "is valid with an admin boolean" do
      expect(admin).to be_valid
    end

    it "defaults to admin => false" do
      expect(user.admin).to eq(false)
    end

    it "has many collections" do
      first_collection = Collection.create(:user_id => user.id, :manga_id => kenshin.id)
      second_collection = Collection.create(:user_id => user.id, :manga_id => onepiece.id)
      expect(user.collections.first).to eq(first_collection)
      expect(user.collections.last).to eq(second_collection)
    end

    it "has many manga through collections" do
      user.mangas << [kenshin, onepiece]
      expect(user.mangas.first).to eq(kenshin)
      expect(user.mangas.last).to eq(onepiece)
    end

end
