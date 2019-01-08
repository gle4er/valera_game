require 'rails_helper'

RSpec.describe Valera, type: :model do
  describe 'Valera model' do

    after do
      Timecop.return
    end

    let(:user) { create(:user) }
    let(:valera) { Valera.create user_id: user.id }

    it 'initializing with default values' do
      expect(valera.hp).to eq 100
      expect(valera.max_hp).to eq 100
      expect(valera.mp).to eq 20
      expect(valera.max_mp).to eq 50
      expect(valera.attack).to eq 3
      expect(valera.defense).to eq 3
      expect(valera.lucky).to eq 3
      expect(valera.money).to eq 500
      expect(valera.xp).to eq 0
      expect(valera.level).to eq 0
      expect(valera.out_time).to eq nil
      expect(valera.skill).to eq ''
    end

    context 'health' do
      it 'setting hp greater than 100' do
        valera.hp = 101
        expect(valera.hp).to eq 100
      end
    end

    context 'mana' do
      it 'decrease hp to 0.8 + level / 1000, when have mp (max_mp; max_mp * 1.3]' do
        valera.mp = valera.max_mp * 1.3
        expect(valera.hp).to eq valera.max_hp * (0.8 + valera.level / 1000)
      end

      it 'going out about 1 minute, when mp > max_mp * 1.3' do
        valera.mp = valera.max_mp * 2
        expect(valera.is_out?).to eq true
        Timecop.travel(Time.now.utc + 60)
        expect(valera.is_out?).to eq false
      end

    end

  end
end
