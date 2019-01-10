require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  context "when not logged" do
    it 'returns to log in, when user is not logged' do
      get :show
      expect(response).to have_http_status(:redirect)
    end
  end
  
  context "when logged" do
    login_user
    let(:valera) { subject.current_user.valera }
    before(:each) { @item = FactoryBot.create(:item) }

    describe 'show' do
      it 'only shows valeras items' do
      end
    end

    describe 'create' do
      before(:each) { @item = FactoryBot.create(:item) }

      it { expect{ get :create, :params => { "item_id" => 1 } }.to change{ valera.money }.by(-@item.money) }

      it { expect{ get :create, :params => { "item_id" => 1 } }.to change{ valera.items.count }.by 1 }

      it 'redirects, after item created' do
        get :create, :params => { "item_id" => 1 }
        expect(response).to have_http_status(:redirect)
      end

      it 'warnings user, when money is not enough' do
        valera.money = 0
        get :create, :params => { "item_id" => 1 }
        expect(flash[:notice]).to include('Not enough money')
      end

      it 'notice user, when item is added sucessfull' do
        get :create, :params => { "item_id" => 1 }
        expect(flash[:notice]).to include('added')
      end

    end

    describe 'destroy' do
      before (:each) { get :create, :params => { "item_id" => 1 } }

      # TODO: rename id to item_id in method create
      it { expect{ get :destroy, :params => { "item_id" => 1 } }.to change { valera.items.count }.by -1 }

      it 'multiple items one per time' do
        get :create, :params => { "item_id" => 1 }
        get :destroy, :params => { "item_id" => 1 }
        expect(valera.items.count).to eq 1
      end

      it 'apply stats to valera' do
        valera.hp = 2
        expect{ get :destroy, :params => { "item_id" => 1 } }.to change { valera.hp }.by @item.hp
      end

      it 'notice user, after item used' do
        get :destroy, :params => { "item_id" => 1 }
        expect(flash[:notice]).to include('used')
      end

      it 'redirect to show' do
        get :destroy, :params => { "item_id" => 1 }
        expect(response).to have_http_status(:redirect)
      end

    end

    describe 'new' do
      before (:each) { get :create, :params => { "item_id" => 1 } }

      it 'prepare list of all items' do
      end

    end

  end
end
