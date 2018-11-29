class Valera < ApplicationRecord
  #def initialize
    #@hp = 100
    #@maxHp = 100
    #@mp = 20
    #@maxMp = 50
    #@attack = 3
    #@defense = 3
    #@lucky = 3
    #@money = 500
    #@xp = 0
    #@level = 0
    #@outTime = nil
    #@skill = ''
  #end

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
