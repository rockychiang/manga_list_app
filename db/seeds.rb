DATA = [
    {name: "Luffy", email: "luffy@onepiece.com", password: "password"},
    {name: "Kenshin", email: "rurouni@kenshin.com", password: "password"},
    {name: "Onizuka", email: "onizuka@gto.com", password: "password"},
    {name: "Kaneki", email: "kaneki@tgre.com", password: "password"},
    {name: "Naruto", email: "naruto@naruto.com", password: "password"},
    {name: "Goku", email: "goku@dbz.com", password: "password"},
    {name: "Edward", email: "ed@fma.com", password: "password"},
    {name: "Admin", email: "admin@manga.com", password: "password", admin: true}
]

def main
  make_users
  make_authors_and_manga
  make_collections
end

def make_users
  DATA.each{|user| User.create(user)}
end

def make_authors_and_manga
  oda = Author.create(name: "Oda, Eiichiro")
  oda.mangas.create(title: "One Piece", status: "On Going", start_date: "1997-07-22")

  watasuki = Author.create(name: "Watsuki, Nobuhiro")
  watasuki.mangas.create(title: "Rurouni Kenshin", status: "Completed", volumes: 28, chapters: 259, start_date: "1994-04-12", end_date: "1999-09-21")

  fujisawa = Author.create(name: "Fujisawa, Tohru")
  fujisawa.mangas.create(title: "GTO", status: "Completed", volumes: 25, chapters: 208, start_date: "1996-12-11", end_date: "2002-01-30")

  ishida = Author.create(name: "Ishida, Sui")
  ishida.mangas.create(title: "Tokyo Ghoul:re", status: "On Going", start_date: "2014-10-16")
  ishida.mangas.create(title: "Tokyo Ghoul", status: "Completed", volumes: 14, chapters: 144, start_date: "2011-09-08", end_date: "2014-09-18")

  kishimoto = Author.create(name: "Kishimoto, Masashi")
  kishimoto.mangas.create(title: "Naruto", status: "Completed", volumes: 72, chapters: 700, start_date: "1999-09-21", end_date: "2014-11-10")

  toriyama = Author.create(name: "Toriyama, Akira")
  toriyama.mangas.create(title: "Dragon Ball", status: "Completed", volumes: 42, chapters: 520, start_date: "1984-11-20", end_date: "1995-05-23")
  toriyama.mangas.create(title: "Dragon Ball Super", status: "On Going", start_date: "2015-06-20")

  arakawa = Author.create(name: "Arakawa, Hiromu")
  arakawa.mangas.create(title: "Fullmetal Alchemist", status: "Completed", volumes: 27, chapters: 116, start_date: "2001-07-12", end_date: "2010-09-11")
end

def make_collections
  users = User.all
  users.each do |user|
    Manga.all.each do |manga|
      user.mangas << manga
      user.save
    end
  end
end

main
