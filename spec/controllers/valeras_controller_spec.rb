require 'rails_helper'

RSpec.describe ValerasController, type: :controller do
  context "when not logged" do
    it 'returns to log in, when user is not logged' do
      get :show
      expect(response).to have_http_status(:redirect)
    end
  end

  context "when logged" do
    login_user
    let(:valera) { subject.current_user.valera }
    before(:each) { valera.skill = "1" }

    describe 'new' do
      it 'choose valeras skill' do
        valera.skill = ''
        get :new
        expect(response).to have_http_status(:success)
      end

      it 'redirects, after skill have choosed' do
        valera.skill = '1'
        get :new
        expect(response).to have_http_status(:redirect)
      end

    end

    describe 'create' do
      it 'creates valera' do
        @user.valera.destroy
        get :create, :params => { "valera" => { "skill" => "1" } }
        expect(valera.nil?).not_to eq true
      end

      it 'set valeras skill, after creating' do
        get :create, :params => { "valera" => { "skill" => "1" } }
        expect(valera.skill).to eq "1"
      end

      it 'redirect after all' do
        get :create, :params => { "valera" => { "skill" => "1" } }
        expect(response).to have_http_status(:redirect)
      end

    end

    describe 'show' do
      it { get :show; expect(response).to have_http_status(:success) }

      it 'redirect, before create' do
        valera.skill = ''
        get :show
        expect(response).to have_http_status(:redirect)
        @user.valera.destroy
        get :show
        expect(response).to have_http_status(:redirect)
      end

    end

  end
end
