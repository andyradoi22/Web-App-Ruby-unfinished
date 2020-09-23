FactoryBot.define do
    factory :entry do
      title { "MyString" }
      level { 1 }
      user { nil }
      board { nil }
    end
  end