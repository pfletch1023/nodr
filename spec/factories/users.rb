# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    provider "MyString"
    uid "MyString"
    first_name "MyString"
    last_name "MyString"
    avatar "MyString"
  end
end
