FactoryBot.define do
  factory :event do
    name { "Meditation" }
    hp { 3 }
    mp { -2 }
    attack { nil }
    defense { nil }
    lucky { nil }
    money { nil }
    xp { nil }
    duration { 60 }
  end
end
