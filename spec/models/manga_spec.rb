require 'rails_helper'

RSpec.describe Manga, :type => :model do
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

    it "On Going Manga is valid with a title, status, and start date" do
      expect(onepiece).to be_valid
    end

    it "Finished Manga is valid with a title, status, volumes, chapters, start date, and end date" do
      expect(kenshin).to be_valid
    end

    it "has many collections" do
      user_collection = Collection.create(user_id: user.id, manga_id: onepiece.id)
      admin_collection = Collection.create(user_id: admin.id, manga_id: onepiece.id)
      expect(onepiece.collections.first).to eq(user_collection)
      expect(onepiece.collections.last).to eq(admin_collection)
    end

    it "has many users through collections" do
      onepiece.users << [user, admin]
      expect(onepiece.users.first).to eq(user)
      expect(onepiece.users.last).to eq(admin)
    end

    it "belongs to one author" do
      expect(onepiece.author).to eq(oda)
    end

end
