require 'rails_helper'

RSpec.describe Event, type: :model do

  let(:event) { create(:event) }
  context 'testing with meditation' do
    it 'returns only hash with values' do
      hash = event.stats
      expect(hash[:hp]).to eq 3
      expect(hash[:mp]).to eq -2
      expect(hash[:attack]).to eq nil
      expect(hash[:defense]).to eq nil
      expect(hash[:lucky]).to eq nil
      expect(hash[:money]).to eq nil
      expect(hash[:xp]).to eq nil
    end
  end
end
