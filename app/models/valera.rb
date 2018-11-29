class Valera < ApplicationRecord
  before_create do
    self.hp = 100
    self.maxHp = 100
    self.mp = 20
    self.maxMp = 50
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
    @hp = @hp > @maxHp ? @hp = @maxHp : @hp = value
  end

  def mp=(value)
    case value
    when value.negative?
      @mp = 0
    when 0 .. @maxMp
      @mp = value
    when @maxMp .. @maxMp * 1.3
      @mp = @maxMp
      @hp = @hp * (0.8 + @level / 1000)
    else
      @mp = 0
      @hp = @hp * (0.8 + @level / 1000)	
      @outTime = Time.now + 900
    end
  end
end
