require 'rails_helper'

RSpec.describe Item, type: :model do

  let(:item) { create(:item) }

  context 'testing with Podorozhnik' do
    it 'returns only hash with values' do
      hash = item.stats
      expect(hash[:hp]).to eq 2
      expect(hash[:mp]).to eq nil
      expect(hash[:attack]).to eq nil
      expect(hash[:defense]).to eq nil
      expect(hash[:lucky]).to eq nil
    end
  end
end
