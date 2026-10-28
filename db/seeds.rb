User.find_or_create_by!(email: "admin@litoria.ru") do |user|
  user.username = "admin"
  user.bio = "Администратор Литории"
  user.role = "admin"
  user.password = ENV.fetch("LITORIA_ADMIN_PASSWORD")
end

sofia = User.find_or_create_by!(email: "sofia@example.com") do |user|
  user.username = "sofia_writer"
  user.bio = "Пишу фэнтези, драму и ориджиналы."
  user.role = "user"
  user.password = ENV.fetch("LITORIA_SOFIA_PASSWORD")
end

olya = User.find_or_create_by!(email: "olya@example.com") do |user|
  user.username = "olya_reader"
  user.bio = "Читаю фанфики и люблю находить новые истории."
  user.role = "user"
  user.password = ENV.fetch("LITORIA_OLYA_PASSWORD")
end

sofya = User.find_or_create_by!(email: "sofya@example.com") do |user|
  user.username = "sofya_reader"
  user.bio = "Читаю ориджиналы, драму и романтические истории."
  user.role = "user"
  user.password = ENV.fetch("LITORIA_SOFYA_PASSWORD")
end

puts "Пользователи созданы: #{User.count}"


originals = Fandom.find_or_create_by!(name: "Ориджиналы") do |fandom|
  fandom.description = "Оригинальные произведения, не связанные с существующими вселенными."
end

harry_potter = Fandom.find_or_create_by!(name: "Гарри Поттер") do |fandom|
  fandom.description = "Фанатские произведения по вселенной Гарри Поттера."
end

Fandom.find_or_create_by!(name: "Genshin Impact") do |fandom|
  fandom.description = "Фанатские произведения по вселенной Genshin Impact."
end

Fandom.find_or_create_by!(name: "Baldur's Gate 3") do |fandom|
  fandom.description = "Фанатские произведения по вселенной Baldur's Gate 3."
end

puts "Фандомы созданы: #{Fandom.count}"


fantasy = Tag.find_or_create_by!(name: "Фэнтези") do |tag|
  tag.kind = "genre"
end

romance = Tag.find_or_create_by!(name: "Романтика") do |tag|
  tag.kind = "genre"
end

drama = Tag.find_or_create_by!(name: "Драма") do |tag|
  tag.kind = "genre"
end

slow_burn = Tag.find_or_create_by!(name: "Slow burn") do |tag|
  tag.kind = "trope"
end

Tag.find_or_create_by!(name: "Enemies to lovers") do |tag|
  tag.kind = "trope"
end

magic = Tag.find_or_create_by!(name: "Магия") do |tag|
  tag.kind = "tag"
end

Tag.find_or_create_by!(name: "Насилие") do |tag|
  tag.kind = "warning"
end

Tag.find_or_create_by!(name: "Смерть персонажа") do |tag|
  tag.kind = "warning"
end

puts "Теги созданы: #{Tag.count}"


north_of_midnight = Work.find_or_create_by!(
  title: "Севернее полуночи",
  user: sofia
) do |work|
  work.summary = "Город исчезает каждую зиму, но однажды двое его жителей решают остаться."
  work.work_type = "original"
  work.rating = "16+"
  work.status = "ongoing"
  work.fandom = originals
end

letters_from_hogwarts = Work.find_or_create_by!(
  title: "Письма из Хогвартса",
  user: sofia
) do |work|
  work.summary = "После окончания школы герои продолжают общаться через письма и постепенно узнают друг друга заново."
  work.work_type = "fanfiction"
  work.rating = "18+"
  work.status = "completed"
  work.fandom = harry_potter
end

puts "Произведения созданы: #{Work.count}"


[ fantasy, drama, slow_burn, magic ].each do |tag|
  unless north_of_midnight.tags.include?(tag)
    north_of_midnight.tags << tag
  end
end

[ romance, slow_burn, magic ].each do |tag|
  unless letters_from_hogwarts.tags.include?(tag)
    letters_from_hogwarts.tags << tag
  end
end


north_chapter_1 = Chapter.find_or_create_by!(
  work: north_of_midnight,
  title: "Глава 1. Первый снег"
) do |chapter|
  chapter.body = "Снег начался раньше обычного. Город постепенно затихал, а улицы пустели."
  chapter.position = 1
end

Chapter.find_or_create_by!(
  work: north_of_midnight,
  title: "Глава 2. После полуночи"
) do |chapter|
  chapter.body = "Когда часы пробили двенадцать, город изменился до неузнаваемости."
  chapter.position = 2
end

Chapter.find_or_create_by!(
  work: letters_from_hogwarts,
  title: "Глава 1. Первое письмо"
) do |chapter|
  chapter.body = "Письмо пришло неожиданно, спустя несколько месяцев после окончания школы."
  chapter.position = 1
end

hogwarts_chapter_2 = Chapter.find_or_create_by!(
  work: letters_from_hogwarts,
  title: "Глава 2. Ответ"
) do |chapter|
  chapter.body = "Ответ оказался длиннее, чем она ожидала, и совсем не таким, каким она его представляла."
  chapter.position = 2
end

puts "Главы созданы: #{Chapter.count}"


Comment.find_or_create_by!(
  user: olya,
  commentable: north_of_midnight
) do |comment|
  comment.body = "Очень понравилась атмосфера произведения."
end

Comment.find_or_create_by!(
  user: sofya,
  commentable: north_chapter_1
) do |comment|
  comment.body = "Первая глава сразу зацепила, хочется читать дальше."
end

Comment.find_or_create_by!(
  user: olya,
  commentable: letters_from_hogwarts
) do |comment|
  comment.body = "Очень уютная история, понравилась идея с письмами."
end

Comment.find_or_create_by!(
  user: sofya,
  commentable: hogwarts_chapter_2
) do |comment|
  comment.body = "Во второй главе особенно понравился диалог."
end

puts "Комментарии созданы: #{Comment.count}"
