require 'rails_helper'

describe "Registering new users" do 
	def register_user(options={})
		options[:first_name]            ||= "mike"
		options[:last_name]             ||= "mcdevitt"
		options[:username]              ||= "mmcdevi1"
    options[:email]                 ||= "mmcdevi1@gmail.com"
    options[:password]              ||= "password"
    options[:password_confirmation] ||= "password"

    visit register_path

    fill_in "First Name",            with: options[:first_name]
    fill_in "Last Name",             with: options[:last_name]
    fill_in "Username",              with: options[:username]
    fill_in "Email",                 with: options[:email]
    fill_in "Password",              with: options[:password]
    fill_in "Password Confirmation", with: options[:password_confirmation]
    click_button "Register"
  end

	context "with valid params" do 
		it "should create a new user" do 
			register_user
			expect(page).to have_content("Welcome! You have signed up successfully")
		end
	end

	# context "with invalid params" do 
	# 	before do 
	# 		expect(User.count).to eq(0)
	# 	end

	# 	it "should not create a new user if email is empty" do 
	# 		register_user email: ""
	# 	end

	# 	it "should not create a new user if password is empty" do 
	# 		register_user password: ""
	# 	end

	# 	it "should not create a new user if password confirmation is empty" do 
	# 		register_user password_confirmation: ""
	# 	end

	# 	it "should not create a new user if password and password confirmation do not match" do 
	# 		register_user password_confirmation: "passwordd"
	# 	end
	# end
end