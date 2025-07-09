FactoryBot.define do
    factory :user do
        email { Faker::Internet.unique.email }
        admin { false }
        password { 'ValidPass123!' }
    end
  end
