# Read about factories at https://github.com/thoughtbot/factory_girl

require 'faker'

FactoryGirl.define do
  factory :user do
    provider "facebook"
    uid "123456789"
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.first_name }
    email { Faker::Internet.email }
    avatar "http://www.gravatar.com/avatar/00000000000000000000000000000000"
    admin false
  end
end
