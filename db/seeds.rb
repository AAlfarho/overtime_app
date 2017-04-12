@user = User.create(email: "test@test.com", password: "asdasd", password_confirmation: "asdasd", first_name: "andres", last_name: "alfaro")
@amind_user = AdminUser.create(email: "admin@admin.com", password: "asdasd", password_confirmation: "asdasd", first_name: "andres el admin", last_name: "alfaro")
@user.save
20.times do |post|
    Post.create(date: Date.today, rationale: "Rationale n #{post+1}", user_id: @user.id, overtime_hours: 1.5)
end
Post.create(date: Date.today, rationale: "Rationale n 21", user_id: @user.id, overtime_hours: 1.5, status: 'rejected')
Post.create(date: Date.today, rationale: "Rationale n 22", user_id: @user.id, overtime_hours: 1.5, status: 'approved')
Post.create(date: Date.today, rationale: "Rationale n 23", user_id: @user.id, overtime_hours: 1.5, status: 'approved')
puts "23 posts created."