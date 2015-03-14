require 'rails_helper'

describe "Registering new admins" do 
	def register_admin(options={})
    options[:email]                 ||= "mmcdevi1@gmail.com"
    options[:password]              ||= "password"
    options[:password_confirmation] ||= "password"

    visit admin_register_path
    expect(page).to have_content("Sign up Admin")

    fill_in "Email",                 with: options[:email]
    fill_in "Password",              with: options[:password]
    fill_in "Password confirmation", with: options[:password_confirmation]
    click_button "Sign up"
  end

	context "with valid params" do 
		it "should create a new admin" do 
			register_admin
			expect(Admin.count).to eq(1)
		end
	end

	context "with invalid params" do 
		before do 
			expect(Admin.count).to eq(0)
		end

		it "should not create a new admin if email is empty" do 
			register_admin email: ""
		end

		it "should not create a new admin if password is empty" do 
			register_admin password: ""
		end

		it "should not create a new admin if password confirmation is empty" do 
			register_admin password_confirmation: ""
		end

		it "should not create a new admin if password and password confirmation do not match" do 
			register_admin password_confirmation: "passwordd"
		end
	end
end
























