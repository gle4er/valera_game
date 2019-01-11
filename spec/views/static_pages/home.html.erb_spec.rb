require 'rails_helper'

RSpec.describe "static_pages/home.html.erb", type: :view do
  before(:each) { render }
  it { expect(render).to include "home" }
  it { expect(render).to have_link('Sign in', href: new_user_session_path) }
  it { expect(render).to have_link('Sign up', href: new_user_registration_path) }
end
