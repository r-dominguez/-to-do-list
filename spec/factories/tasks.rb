FactoryBot.define do
    factory :task do
      title { Faker::Lorem.sentence }
      description { Faker::Lorem.paragraph }
      completed { false }
      user { association :user }  # Asume que ya tienes una factory para User
    end
  end
