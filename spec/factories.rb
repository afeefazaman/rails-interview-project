FactoryBot.define do
  factory :tenant do
    current_day_count { 0 }
    total_requests_count { 0 }
    name { 'Test tenant' }
  end

  factory :answer do
    association :provider, factory: :user
    question
    body { 'answer body' }
  end

  factory :question do
    association :asker, factory: :user
    title { 'question' }
  end

  factory :user do
    name { "Joe" }
  end
end
