require 'rails_helper'

describe User do 
	describe "relationships" do 
		it { should have_many(:reviews) }
	end

	describe "validations" do 
		it { should validate_uniqueness_of(:username) }
		it { should validate_uniqueness_of(:email) }
		it { should validate_presence_of(:email) }
		it { should validate_presence_of(:username) }
		it { should validate_presence_of(:first_name) }
		it { should validate_presence_of(:last_name) }
	end

	describe "#full_name" do 
		it "returns the full name of the current user" do 
			user = Fabricate(:user, first_name: "Michael", last_name: "McDevitt")
			expect(user.full_name).to eq("Michael McDevitt")
		end
	end

	describe "#review_count" do 
		it "returns the total count of video reviews done by the user" do 
			user     = Fabricate(:user)
			review   = Fabricate(:review)
			review_2 = Fabricate(:review)
			expect(user.review_count).to eq(2)
		end
	end

	describe "#sum_game_length" do 

	end

end