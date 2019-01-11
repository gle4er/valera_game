FactoryBot.define do
  factory :valera do
    hp { 1 }
    mp { 1 }
    attack { 1 }
    defense { 1 }
    lucky { 1 }
    money { 1 }
    skill { "MyString" }
    maxHp { 1 }
    maxMp { "" }
    level { 1 }
    xp { 1 }
    outTime { nil }
  end
end
