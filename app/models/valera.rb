class Valera < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :items

  before_create do
    self.max_hp = 100
    self.hp = 100
    self.max_mp = 50
    self.mp = 20
    self.attack = 3
    self.defense = 3
    self.lucky = 3
    self.money = 500
    self.xp = 0
    self.level = 0
    self.out_time = nil
    self.skill = ''
  end

  def hp=(value)
    hp = value > self.max_hp ? self.max_hp : value
    super(hp)
  end

  def mp=(value)
    case value
    when value.negative?
      super(0)
    when 0 .. self.max_mp
      super(value)
    when self.max_mp .. self.max_mp * 1.3
      super(self.max_mp)
      self.hp = self.hp * (0.8 + self.level / 1000)
    else
      super(0)
      self.hp = self.hp * (0.8 + self.level / 1000)	
      self.out_time = Time.now + 15 * 60
    end
  end

  def is_out?
    unless out_time.nil?
      @curr_time = Time.now.utc
      self.out_time = @curr_time >= self.out_time ? nil : self.out_time
    end
    !out_time.nil?
  end

  def stats
    {
      hp: hp, max_hp: max_hp, mp: mp, max_mp: max_mp,
      attack: attack, defense: defense, lucky: lucky,
      money: money, level: level, skill: skill
    }
  end
end
