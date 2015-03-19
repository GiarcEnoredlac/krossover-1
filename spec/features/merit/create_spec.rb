require 'rails_helper'

describe "Gaining Badges" do 
	let(:user)   { Fabricate(:user) }

	before do 
    visit login_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password 
    click_button "Log in"
  end

  it "should give a user a Pickup badge" do 
  	user.reviews.create(title: "some title")
		expect(user.badges.count).to eq(1)
	end
end