require 'rails_helper'

describe 'admin dashboard' do
  it 'can bea reached successfully' do
    visit admin_root_path
    expect(page.status_code).to eq(200)
  end

  it 'redirects non logged users ' do
    visit admin_root_path
    expect(page.current_path).to eq(new_user_session_path)
  end

  it 'cannot be reached by non admin users' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)

    visit admin_root_path
    expect(page.current_path).to eq(root_path)
  end

  it 'can be reached by admin users' do
    user = FactoryGirl.create(:admin_user)
    login_as(user, :scope => :user)

    visit admin_root_path
    expect(page.current_path).to eq(admin_root_path)
  end
end