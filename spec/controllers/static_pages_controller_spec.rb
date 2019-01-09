require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do

  describe "GET #home" do
    it "returns http success" do
      get :home
      expect(response).to have_http_status(:success)
    end

    context "when logged" do
      login_user
      it "redirects when user is logged in system" do
        get :home
        expect(response).to have_http_status(:redirect)
      end
    end
  end

end
