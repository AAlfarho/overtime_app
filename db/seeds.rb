100.times do |post|
    Post.create(date: Date.today, rationale: "Rationale n #{post}")
end
puts "100 posts created."