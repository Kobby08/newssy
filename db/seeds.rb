user_id = [1, 2].sample
channel_id = [1, 2, 3, 4, 5].sample

# User
2.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    username: Faker::Internet.username,
    email: Faker::Internet.email,
    password: 'password',
    password_confirmation: 'password',
  )
end

# Channel
5.times do
  Channel.create(
    name: Faker::Company.name,
    user_id: user_id,
    description:
      Faker::Lorem.paragraph(
        sentence_count: 2,
        supplemental: false,
        random_sentences_to_add: 4,
      ),
  )
end

# Links
5.times do
  Link.create(
    title: Faker::Lorem.sentence,
    url: Faker::Internet.domain_name,
    channel_id: channel_id,
    user_id: user_id,
  )
end
