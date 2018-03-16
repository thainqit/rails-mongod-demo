namespace :create_test do
  desc 'create users'
  task users: :environment do
    10.times do |i|
      puts "Creating #{i + 1}th user"
      User.create!(first_name: Faker::Name.first_name,
                   last_name: Faker::Name.last_name,
                   email: Faker::Internet.email)
    end
  end

  desc 'create articles'
  task articles: :environment do
    user_ids = User.all.limit(20).map(&:id)
    20.times do |i|
      puts "Creating #{i + 1}th article"
      Article.create!(title: Faker::Lorem.sentence,
                      body: Faker::Lorem.paragraph,
                      rating: rand(5) + 1,
                      user_id: user_ids.sample)
    end
  end
end
