require 'rails_helper'

describe 'navigate' do
  before do
    @user = FactoryGirl.create(:user)
    login_as(@user, :scope => :user)
  end
  describe 'homepage' do
    it 'can be reached successfully' do
      visit root_path
      expect(page.status_code).to eq(200)
    end
    describe 'new tab' do
      it 'can be reached from the beginning' do
        visit root_path
        click_link('new_post_from_nav')
        expect(page.status_code).to eq(200)
      end
    end
  end
end