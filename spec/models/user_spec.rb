require 'spec_helper'

describe User do
	before { @user = FactoryGirl.build(:user) }
	it "has a valid factory" do
		@user.should be_valid
	end
	it "is invalid without a provider" do
		@user.provider = nil
		@user.should_not be_valid
	end
	it "is invalid without a uid" do
		@user.uid = nil
		@user.should_not be_valid
	end
	it "is invalid without a first name" do
		@user.first_name = nil
		@user.should_not be_valid
	end
	it "is invalid without a last name" do
		@user.last_name = nil
		@user.should_not be_valid
	end
	it "is invalid without an email" do
		@user.email = nil
		@user.should_not be_valid
	end
	it "is invalid without an avatar" do
		@user.avatar = nil
		@user.should_not be_valid
	end
	it "is not an admin by default" do
		@user.should_not be_admin_id
	end
	it "is an admin if it has an admin uid" do
		@user.uid = "594889925"
		@user.should be_admin_id
	end
end
