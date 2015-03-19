require 'rails_helper'

RSpec.describe DashboardsController, type: :controller do

  let(:user) { Fabricate(:user) }

	before do 
		session[:user_id] = user.id
	end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "renders the index template" do 
    	get :index
    	expect(response).to render_template :index
    end
  end

end
