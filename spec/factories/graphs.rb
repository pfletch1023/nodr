# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :graph do
  	name { Faker::Lorem.words.join(" ") }
  	description { Faker::Lorem.paragraph }
  	user_id 1
  end
end
