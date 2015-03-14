require 'rails_helper'

describe User do 
	describe "relationships" do 

	end

	describe "validations" do 
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_uniqueness_of(:username) }
	end
	
  describe "#full_name" do 
    it "returns the full_name of the current_user" do 
      user = Fabricate(:user, first_name: "Michael", last_name: "McDevitt")
      expect(user.full_name).to eq("Michael McDevitt")
    end
  end
end
