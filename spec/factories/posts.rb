FactoryGirl.define do

  factory :post, class: 'Post' do
    date Date.today
    rationale "Rationale"
    overtime_hours 1.0
    user
  end

  ##one way to do it
  factory :post_with_user, class: 'Post' do
    date Date.today
    rationale "Rationale"
    overtime_hours 1.0
    user_id -1
  end

  factory :post_with_rationale_n_user, class: 'Post' do
    date Date.today
    rationale ""
    overtime_hours 1.0
    user_id  -1
  end

  factory :second_post, class: 'Post' do
    date Date.today
    rationale "More Rationale"
    overtime_hours 1.0
  end

  factory :post_with_rationale_user_n_hrs, class: 'Post' do
    date Date.today
    rationale ""
    overtime_hours 0.0
    user_id  -1

  end
end