@user = User.create(email: "test@test.com", password: "asdasd", password_confirmation: "asdasd", first_name: "andres", last_name: "alfaro")
@user.save
100.times do |post|
    Post.create(date: Date.today, rationale: "Rationale n #{post}", user_id: @user.id)
end
puts "100 posts created."