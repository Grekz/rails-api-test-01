namespace :dev do
  desc "Configure development environment"
  task setup: :environment do
    p "Creating contacts..."
    100.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 65.years.ago, to: 18.years.ago)
      ) 
    end
    p "Contacts created."
  end

end
