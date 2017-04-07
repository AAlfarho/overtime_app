FactoryGirl.define do

  factory :post, class: 'Post' do
    date Date.today
    rationale "Rationale"
    user
  end

  ##one way to do it
  factory :post_with_user, class: 'Post' do
    date Date.today
    rationale "Rationale"
    user_id -1
  end

  factory :post_with_rationale, class: 'Post' do
    date Date.today
    rationale ""
    user
  end

  factory :second_post, class: 'Post' do
    date Date.today
    rationale "More Rationale"
  end
end