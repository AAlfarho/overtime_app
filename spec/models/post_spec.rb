require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "creation" do
    before do
      @post = FactoryGirl.create(:post)# Post.create(date: Date.today, rationale: "Teeeeest")
    end
    it "can be created" do
      expect(@post).to be_valid
    end

    it "cannot be created without date, rationale or overtime hours" do
      @post.date = nil
      @post.rationale = nil
      @post.overtime_hours = nil
      expect(@post).to_not be_valid
    end
    it "has an overtime hrs greater than 0" do
      ##If we try to create it with 0.0 an exception will be raised, which is expected
      custom_post = FactoryGirl.create(:post_with_rationale_user_n_hrs, rationale: "0 hours rationale", overtime_hours: 1.0)
      custom_post.overtime_hours = 0.0
      expect(custom_post).to_not be_valid
    end
  end
end
