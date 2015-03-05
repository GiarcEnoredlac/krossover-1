require 'spec_helper'

describe UsersController do 
	describe "GET new" do 
		it "sets @user" do 
			get :new
			expect(assigns(:user)).to be_instance_of(User)
		end
	end

	describe "POST create" do 
		context "with valid inputs" do 
			before do 
				post :create, user: Fabricate.attributes_for(:user)
			end

			it "should create a new user" do 
				expect(User.count).to eq(1)
			end

			it "should redirect to the dashboard"
		end

		context "with invalid inputs" do 
			before do 
				post :create, user: { password: "password", first_name: "Mike" }
			end

			it "should not create a new user" do 
				expect(User.count).to eq(0)
			end

			it "should render the new template" do 
				expect(response).to render_template :new
			end

			it "sets @user" do 
        expect(assigns(:user)).to be_instance_of(User)
      end
		end
	end
end