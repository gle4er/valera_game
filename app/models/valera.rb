class Valera < ApplicationRecord
  belongs_to :user

  before_create do
    self.maxHp = 100
    self.hp = 100
    self.maxMp = 50
    self.mp = 20
    self.attack = 3
    self.defense = 3
    self.lucky = 3
    self.money = 500
    self.xp = 0
    self.level = 0
    self.outTime = nil
    self.skill = ''
  end

  def hp=(value)
    hp = value > self.maxHp ? self.maxHp : value
    super(hp)
  end

  def mp=(value)
    case value
    when value.negative?
      super(0)
    when 0 .. self.maxMp
      super(value)
    when self.maxMp .. self.maxMp * 1.3
      super(self.maxMp)
      self.hp = self.hp * (0.8 + self.level / 1000)
    else
      super(0)
      self.hp = self.hp * (0.8 + self.level / 1000)	
      self.outTime = Time.now + 15 * 60
    end
  end

  def stats
    {
      hp: hp, maxHp: maxHp, mp: mp, maxMp: maxMp,
      attack: attack, defense: defense, lucky: lucky,
      money: money, level: level, skill: skill
    }
  end
end
