user_id = [1, 2]
channel_id = [1, 2, 3, 4, 5]
category_id = [1, 2, 3, 4, 5]
name = %w[Sports Business Entertainmnet Politics Health]
email = %w[nana@gmail.com quam@gmail.com]

s = Scraper.new
newsfeeds = s.scrape.sample(10)

puts 'Seeding database..'
# User
2.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    username: Faker::Internet.username,
    email: email.sample,
    password: 'password',
    password_confirmation: 'password',
  )
end

# Channel
5.times do
  Channel.create(
    name: Faker::Company.name,
    user_id: user_id.sample,
    description:
      Faker::Lorem.paragraph(
        sentence_count: 2,
        supplemental: false,
        random_sentences_to_add: 4,
      ),
  )
end

# Categories
5.times { Category.create(name: name.sample, user_id: user_id.sample) }

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
