require 'rails_helper'

describe Users::RegistrationsController do 
	describe "GET new" do 
		it "sets @user variable" do 
			get :new
			expect(assigns(:user)).to be_new_record
		end
	end
end