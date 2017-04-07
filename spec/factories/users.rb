FactoryGirl.define do
  sequence :email do |n|
    "test#{n}@test.com"
  end

  factory :user do
    first_name "andres"
    last_name "alfaro"
    email {generate :email}
    password "asdasd"
    password_confirmation "asdasd"
  end

  factory :admin_user, class: 'AdminUser' do
    first_name "admin"
    last_name "admin"
    email "admin@test.com"
    password "asdasd"
    password_confirmation "asdasd"
  end
end