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
  oda.mangas.create(title: "One Piece", status: "On Going", start_date: 19970722)

  watasuki = Author.create(name: "Watsuki, Nobuhiro")
  watasuki.mangas.create(title: "Rurouni Kenshin", status: "Completed", volumes: 28, chapters: 259, start_date: 19940412, end_date: 19990921)

  fujisawa = Author.create(name: "Fujisawa, Tohru")
  fujisawa.mangas.create(title: "GTO", status: "Completed", volumes: 25, chapters: 208, start_date: 19961211, end_date: 20020130)

  ishida = Author.create(name: "Ishida, Sui")
  ishida.mangas.create(title: "Tokyo Ghoul:re", status: "On Going", start_date: 20141016)
  ishida.mangas.create(title: "Tokyo Ghoul", status: "Completed", volumes: 14, chapters: 144, start_date: 20110908, end_date: 20140918)

  kishimoto = Author.create(name: "Kishimoto, Masashi")
  kishimoto.mangas.create(title: "Naruto", status: "Completed", volumes: 72, chapters: 700, start_date: 19990921, end_date: 20141110)

  toriyama = Author.create(name: "Toriyama, Akira")
  toriyama.mangas.create(title: "Dragon Ball", status: "Completed", volumes: 42, chapters: 520, start_date: 19841120, end_date: 19950523)
  toriyama.mangas.create(title: "Dragon Ball Super", status: "On Going", start_date: 20150620)

  arakawa = Author.create(name: "Arakawa, Hiromu")
  arakawa.mangas.create(title: "Fullmetal Alchemist", status: "Completed", volumes: 27, chapters: 116, start_date: 20010712, end_date: 20100911)
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
