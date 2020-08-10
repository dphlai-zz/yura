puts "Creating posts"
Post.destroy_all

p1 = Post.create! title: 'Lane Cove National Park', caption: 'I really liked hiking here.'
p2 = Post.create! title: 'Ku-ring-gai National Park', caption: 'Nice views.'
p3 = Post.create! title: 'Wentworth Falls', caption: 'Awesome!'

puts "Created #{Post.count} posts."

# ------------------------------------------------------------------------------

puts "Creating users"
User.destroy_all

u1 = User.create! name:'Danny', email: 'danny@ga.co', password: 'chicken'
u2 = User.create! name:'Luke', email: 'luke@ga.co', password: 'chicken'

puts "Created #{User.count} users."

u1.posts << p1 << p2
u2.posts << p3

print "User #{User.first.name} has the following posts: "
puts User.first.posts.pluck(:title).join(', ')
