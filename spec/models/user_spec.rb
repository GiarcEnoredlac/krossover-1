require 'spec_helper'

describe User do 
	describe "Relationships" do 
  end

  describe "Validations" do 
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_uniqueness_of(:email) }
  end
end
