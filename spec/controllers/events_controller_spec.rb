require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  context "when not logged" do
    describe 'new' do
      it 'returns to log in, when user is not logged' do
        get :new
        expect(response).to have_http_status(:redirect)
      end
    end
  end

  context "when logged" do
    login_user

    describe 'show' do
      it 'shows all events' do
        get :new
        expect(response).to have_http_status(:success)
      end

      it 'but redirect back to main menu, when users event choise' do
        subject.current_user.valera.out_time = Time.now.utc + 1200
        get :new
        expect(response).to have_http_status(:redirect)
      end

      it 'and warnings user about it' do
        subject.current_user.valera.out_time = Time.now.utc + 1200
        get :new
        expect(flash[:notice]).to include('Warning')
      end
    end

    describe 'create' do
      before(:each) { @event = FactoryBot.create(:event) }
      let(:valera) { subject.current_user.valera }

      it 'set up valeras stats, when events choosed' do
        @stats = @event.stats
        @expect_mp = valera.mp + @stats[:mp]
        get :create, :params => { "id" => 1 }
        expect(valera.mp).to eq @expect_mp
      end

      it 'set up timeout about 1 minute' do
        get :create, :params => { "id" => 1 }
        expect(valera.out_time - Time.now.utc).to be_between(55, 60) 
      end

      it 'redirects, when event choice is successfull' do
        get :create, :params => { "id" => 1 }
        expect(response).to have_http_status(:redirect)
      end

    end
  end

end
