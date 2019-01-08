FactoryBot.define do
  factory :item do
    name { "Podorozhnik" }
    hp { 2 }
    mp { nil }
    attack { nil }
    defense { nil }
    lucky { nil }
    money { 10 }
    xp { nil }
  end
end
