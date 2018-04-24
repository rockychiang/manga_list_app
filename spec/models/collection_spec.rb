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

  let(:onepiece) {
    Manga.create(
      title: "One Piece",
      status: "On Going",
      author_id: oda.id,
      start_date: 1997-07-22
    )
  }

  let(:collection) {
    Collection.create(
      user_id: user.id,
      manga_id: onepiece.id
    )
  }

  it "is valid with a user_id and a manga_id" do
    expect(collection).to be_valid
  end

  it "belongs to one user" do
    expect(collection.user).to eq(user)
  end

  it "belongs to one manga" do
    expect(collection.manga).to eq(onepiece)
  end
end
