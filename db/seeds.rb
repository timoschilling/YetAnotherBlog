users = 100.times.map do
  User.create first_name: Faker::Name.first_name,
              last_name: Faker::Name.last_name,
              email: Faker::Internet.email
end

posts = 1000.times.map do
  Post.create user: users.sample,
              headline: "#{Faker::Hacker.adjective} #{Faker::Hacker.adjective}",
              content: 5.times.map { Faker::Hacker.say_something_smart }.join("\n"),
              created_at: Faker::Date.between(2.days.ago, Time.now)
end

comments = posts.map do |post|
  rand(10).times do
    Comment.create user: users.sample,
                   post: posts.sample,
                   content: 5.times.map { Faker::Hacker.say_something_smart }.join("\n"),
                   created_at: Faker::Date.between(post.created_at, Time.now)
  end
end
