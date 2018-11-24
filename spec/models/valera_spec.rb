require 'rails_helper'

RSpec.describe Valera, type: :model do
  describe 'Valera model' do

    before(:each) do
      valera = Valera.new
    end

    after do
      Timecop.return
    end

    it 'initializing with default values' do
      expect(Valera.hp).to eq 100
      expect(Valera.maxHp).to eq 100
      expect(Valera.mp).to eq 20
      expect(Valera.maxMp).to eq 50
      expect(Valera.attack).to eq 3
      expect(Valera.defense).to eq 3
      expect(Valera.lucky).to eq 3
      expect(Valera.money).to eq 500
      expect(Valera.xp).to eq 0
      expect(Valera.level).to eq 0
      expect(Valera.outTime).to eq nil
      expect(Valera.skill).to eq ''
    end

    it 'decrease hp to 0.8 + level / 1000, when have mp (maxMp; maxMp * 1.3]' do
      valera.mp = valera.maxMp * 1.3
      expect(Valera.hp).to eq valera.maxHp * (0.8 + level / 1000)
    end

    it 'going out about 15 minutes, when mp > maxMp * 1.3' do
      valera.mp = valera.maxMp * 2
      start = Time.now.to_i
      ending = Time.now.to_i + 5
      expect(Valera.outTime.to_i).to be_between(start, ending)
      t = Time.now + 15 * 60
      Timecop.travel(t)
      expect(Valera.outTime).to eq nil
    end
  end
end
