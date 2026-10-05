# Очищаем старые данные

WorkTag.destroy_all
Comment.destroy_all
Chapter.destroy_all
Work.destroy_all
Tag.destroy_all
Fandom.destroy_all
User.destroy_all




admin = User.create!(
  username: "admin",
  email: "admin@litoria.ru",
  bio: "Администратор Литории",
  role: "admin",
  password: "Admin12345!",
  password_confirmation: "Admin12345!"
)

sofia = User.create!(
  username: "sofia_writer",
  email: "sofia@example.com",
  bio: "Пишу фэнтези, драму и ориджиналы.",
  role: "user",
  password: "Sofia12345!",
  password_confirmation: "Sofia12345!"
)

olya = User.create!(
  username: "olya_reader",
  email: "olya@example.com",
  bio: "Читаю фанфики и люблю находить новые истории.",
  role: "user",
  password: "Olya12345!",
  password_confirmation: "Olya12345!"
)

sofya = User.create!(
  username: "sofya_reader",
  email: "sofya@example.com",
  bio: "Читаю ориджиналы, драму и романтические истории.",
  role: "user",
  password: "Sofya12345!",
  password_confirmation: "Sofya12345!"
)

puts "Пользователи созданы: #{User.count}"




originals = Fandom.create!(
  name: "Ориджиналы",
  description: "Оригинальные произведения, не связанные с существующими вселенными."
)

harry_potter = Fandom.create!(
  name: "Гарри Поттер",
  description: "Фанатские произведения по вселенной Гарри Поттера."
)

genshin = Fandom.create!(
  name: "Genshin Impact",
  description: "Фанатские произведения по вселенной Genshin Impact."
)

baldurs_gate = Fandom.create!(
  name: "Baldur's Gate 3",
  description: "Фанатские произведения по вселенной Baldur's Gate 3."
)

puts "Фандомы созданы: #{Fandom.count}"




fantasy = Tag.create!(
  name: "Фэнтези",
  kind: "genre"
)

romance = Tag.create!(
  name: "Романтика",
  kind: "genre"
)

drama = Tag.create!(
  name: "Драма",
  kind: "genre"
)

slow_burn = Tag.create!(
  name: "Slow burn",
  kind: "trope"
)

enemies_to_lovers = Tag.create!(
  name: "Enemies to lovers",
  kind: "trope"
)

magic = Tag.create!(
  name: "Магия",
  kind: "tag"
)

violence = Tag.create!(
  name: "Насилие",
  kind: "warning"
)

character_death = Tag.create!(
  name: "Смерть персонажа",
  kind: "warning"
)

puts "Теги созданы: #{Tag.count}"




north_of_midnight = Work.create!(
  title: "Севернее полуночи",
  summary: "Город исчезает каждую зиму, но однажды двое его жителей решают остаться.",
  work_type: "original",
  rating: "16+",
  status: "ongoing",
  user: sofia,
  fandom: originals
)

letters_from_hogwarts = Work.create!(
  title: "Письма из Хогвартса",
  summary: "После окончания школы герои продолжают общаться через письма и постепенно узнают друг друга заново.",
  work_type: "fanfiction",
  rating: "12+",
  status: "completed",
  user: sofia,
  fandom: harry_potter
)

puts "Произведения созданы: #{Work.count}"




north_of_midnight.tags << [
  fantasy,
  drama,
  slow_burn,
  magic
]

letters_from_hogwarts.tags << [
  romance,
  slow_burn,
  magic
]




north_chapter_1 = Chapter.create!(
  title: "Глава 1. Первый снег",
  body: "Снег начался раньше обычного. Город постепенно затихал, а улицы пустели.",
  position: 1,
  work: north_of_midnight
)

north_chapter_2 = Chapter.create!(
  title: "Глава 2. После полуночи",
  body: "Когда часы пробили двенадцать, город изменился до неузнаваемости.",
  position: 2,
  work: north_of_midnight
)

hogwarts_chapter_1 = Chapter.create!(
  title: "Глава 1. Первое письмо",
  body: "Письмо пришло неожиданно, спустя несколько месяцев после окончания школы.",
  position: 1,
  work: letters_from_hogwarts
)

hogwarts_chapter_2 = Chapter.create!(
  title: "Глава 2. Ответ",
  body: "Ответ оказался длиннее, чем она ожидала, и совсем не таким, каким она его представляла.",
  position: 2,
  work: letters_from_hogwarts
)

puts "Главы созданы: #{Chapter.count}"





Comment.create!(
  body: "Очень понравилась атмосфера произведения.",
  user: olya,
  commentable: north_of_midnight
)

Comment.create!(
  body: "Первая глава сразу зацепила, хочется читать дальше.",
  user: sofya,
  commentable: north_chapter_1
)

Comment.create!(
  body: "Очень уютная история, понравилась идея с письмами.",
  user: olya,
  commentable: letters_from_hogwarts
)

Comment.create!(
  body: "Во второй главе особенно понравился диалог.",
  user: sofya,
  commentable: hogwarts_chapter_2
)

puts "Комментарии созданы: #{Comment.count}"
