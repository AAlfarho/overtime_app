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

  factory :post_with_rationale_n_user, class: 'Post' do
    date Date.today
    rationale ""
    user_id  -1
  end

  factory :second_post, class: 'Post' do
    date Date.today
    rationale "More Rationale"
  end
end