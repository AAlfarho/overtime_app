require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryGirl.create(:user)
  end
  describe "creation" do

    it "can be created" do
      expect(@user).to be_valid
    end

    it "cannot be created without first_name, last_name" do
      @user.first_name = nil
      @user.last_name = nil
      expect(@user).to_not be_valid
    end
  end
  describe "user custom name method" do
    it "has full name method that contains first and last name" do
        expect(@user.full_name).to eq("ALFARO, ANDRES")
    end
  end
end
