require 'rails_helper'

describe 'navigate' do
  before do
  #  @admin_user = FactoryGirl.create(:admin_user)
  # login_as(@admin_user, :scope => :user )
  end

  describe 'edit' do
    it 'has a status that can be edited on the form by an admin' do
      @admin_user = FactoryGirl.create(:admin_user)
      login_as(@admin_user, :scope => :user )
      @post = FactoryGirl.create(:post)
      visit edit_post_path(@post)
      choose('post_status_approved')
      click_on 'Save'

      expect(@post.reload.status).to eq('approved')
    end


    it 'can not be edited by a nonadmin' do
      user = FactoryGirl.create(:user)
      post = FactoryGirl.create(:post_with_user, user_id: user.id)
      login_as(user, :scope => :user)

      visit edit_post_path(post)
      expect(page).to_not have_content('Approved')
    end
  end
end