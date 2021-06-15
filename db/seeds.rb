user_id = [1, 2]
channel_id = [1, 2]
category_id = [1, 2, 3, 4, 5, 6]
name = %w[Sports Business Entertainment Politics Health International]

s = Scraper.new
newsfeeds = s.scrape.sample(20)

puts 'Seeding database..'
# User
User.create(
  first_name: 'Nana',
  last_name: 'Quam',
  username: 'nquam',
  email: 'quam@gmail.com',
  password: 'password',
  password_confirmation: 'password',
)

User.create(
  first_name: 'Joe',
  last_name: 'Doe',
  username: 'jdoe',
  email: 'john@gmail.com',
  password: 'password',
  password_confirmation: 'password',
)

# Channel

Channel.create(
  name: "Quam's Studio",
  user_id: 1,
  description:
    Faker::Lorem.paragraph(
      sentence_count: 2,
      supplemental: false,
      random_sentences_to_add: 4,
    ),
)

Channel.create(
  name: 'Street News',
  user_id: 2,
  description:
    Faker::Lorem.paragraph(
      sentence_count: 2,
      supplemental: false,
      random_sentences_to_add: 4,
    ),
)

# Categories
name.each { |n| Category.create(name: n, user_id: 1) }

# Links
newsfeeds.each do |news|
  Link.create(
    news.merge(
      channel_id: channel_id.sample,
      user_id: user_id.sample,
      category_id: category_id.sample,
    ),
  )
end
