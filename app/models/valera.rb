class Valera < ApplicationRecord
    attr_reader :hp, :maxHp, :mp, :maxMp, :attack, :defense, :lucky, :money, :xp, :level, :outTime, :skill
    attr_writer :maxHp, :maxMp, :level, :outTime

    def initialize
      @hp = 100
      @maxHp = 100
      @mp = 20
      @maxMp = 50
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

    def mp=(value)
        @mp = value
		if(@mp > @maxMp && @mp <= (@maxMp * 1.3)) 
			@mp = @maxMp
			@hp = @hp * (0.8 + @level / 1000)
		end
		if(@mp > @maxMp * 1.3)	
			time = Time.new
			@mp = 0
			@hp = @hp * (0.8 + @level / 1000)	
			@outTime = time + 900
		end
    end
end
