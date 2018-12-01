require 'rails_helper'

RSpec.describe Valera, type: :model do
  describe 'Valera model' do

    after do
      Timecop.return
    end

    let(:valera) { Valera.create }

    it 'initializing with default values' do
      expect(valera.hp).to eq 100
      expect(valera.maxHp).to eq 100
      expect(valera.mp).to eq 20
      expect(valera.maxMp).to eq 50
      expect(valera.attack).to eq 3
      expect(valera.defense).to eq 3
      expect(valera.lucky).to eq 3
      expect(valera.money).to eq 500
      expect(valera.xp).to eq 0
      expect(valera.level).to eq 0
      expect(valera.outTime).to eq nil
      expect(valera.skill).to eq ''
    end

    context 'health' do
      it 'setting hp greater than 100' do
        valera.hp = 101
        expect(valera.hp).to eq 100
      end
    end

    context 'mana' do
      it 'decrease hp to 0.8 + level / 1000, when have mp (maxMp; maxMp * 1.3]' do
        valera.mp = valera.maxMp * 1.3
        expect(valera.hp).to eq valera.maxHp * (0.8 + valera.level / 1000)
      end

      it 'going out about 15 minutes, when mp > maxMp * 1.3' do
        start = Time.now.utc
        ending = Time.now.utc + 5
        valera.mp = valera.maxMp * 2
        expect(valera.outTime).to be_between(start, ending)
      end
    end
  end
end
