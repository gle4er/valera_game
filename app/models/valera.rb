class Valera < ApplicationRecord
    attr_reader :hp, :maxHp, :mp, :maxMp, :attack, :defense, :lucky, :money, :xp, :level, :outTime, :skill
    attr_writer :maxHp, :maxMp, :level, :outTime

    def initialize
      @hp = 100
      @maxHp = 100
      @mp = 20
      @maxMp = 20
      @attack = 3
      @defense = 3
      @lucky = 3
      @money = 500
      @xp = 0
      @level = 0
      @outTime = nil
      @skill = ''
    end

    def hp=(value)
        @hp = value
			@hp > @maxHp ? @hp = @maxHp : @hp = value
        end
        
    end

    def mp=(value)
        @mp = value
			(@mp > @maxMp) ? @mp = @maxMp : @mp = value
        end
    end

end
