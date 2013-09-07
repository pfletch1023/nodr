# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :node do
  	title { Faker::Lorem.words.join(" ") }
  	url { "http://" + Faker::Internet.domain_name }
  end
end
