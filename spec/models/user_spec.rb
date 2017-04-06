require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.create(email: "test@test.com", password: "asdasd", password_confirmation: "asdasd", first_name: "andres", last_name: "alfaro")
    @invalidUser = User.create(email: "test1@test.com", password: "asdasd", password_confirmation: "asdasd")
  end
  describe "creation" do

    it "can be created" do
      expect(@user).to be_valid
    end

    it "cannot be created without first_name, last_name" do
      @invalidUser.first_name = nil
      @invalidUser.last_name = nil
      expect(@invalidUser).to_not be_valid
    end
  end
  describe "user custom name method" do
    it "has full name method that contains first and last name" do
        expect(@user.full_name).to eq("ALFARO, ANDRES")
    end
  end
end
