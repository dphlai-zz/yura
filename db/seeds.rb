puts "Creating posts..."
Post.destroy_all

p1 = Post.create! title: 'Lane Cove National Park', caption: 'I really liked hiking here.'
p2 = Post.create! title: 'Ku-ring-gai National Park', caption: 'Nice views.'
p3 = Post.create! title: 'Wentworth Falls', caption: 'Awesome!'

puts "Created #{Post.count} post(s)."

# ------------------------------------------------------------------------------

puts "Creating users..."
User.destroy_all

u1 = User.create! name:'Danny', email: 'danny@ga.co', password: 'chicken'
u2 = User.create! name:'Luke', email: 'luke@ga.co', password: 'chicken'
u3 = User.create! name:'Goose', email: 'goose@ga.co', password: 'chicken'

puts "Created #{User.count} user(s)."

u1.posts << p1 << p2
u2.posts << p3

print "User #{User.first.name} has the following posts: "
puts User.first.posts.pluck(:title).join(', ')

# ------------------------------------------------------------------------------

puts "Creating hikes..."
Hike.destroy_all

h1 = Hike.create! name:'Wentworth Falls', description: 'This short but steep walk from Wentworth Falls picnic area is well worth the effort. Follow the level path past Jamison and Wentworth lookouts before descending around 200 steps to the cliff-edge Fletchers lookout. Marvel at the waterfall that gives Wentworth Falls its name, as it plunges 100m to the valley floor.'

h2 = Hike.create! name:'Great North Walk', description: 'Passing through Lane Cove National Park, this multi-day hike offers stunning scenery across Sydney, the Hunter Valley and Newcastle. Tackle part of the track for an easy day walk.'

h3 = Hike.create! name:'Bairne Walking Track', description: 'Bairne walking track starts from West Head Road, passing through heathlands of banksia, boronia and grevillea. Look for nectar-loving yellow-faced honeyeaters and the vibrant variegated wren. After around 2.5km, you\'ll reach an intersection. Head south for 1km to Towlers Bay lookout, for magnificent views of Towlers Bay and Pittwater.'

puts "Created #{Hike.count} hike(s)."

h1.posts << p3
h2.posts << p1
h3.posts << p2

# ------------------------------------------------------------------------------

puts "Loading photos..."
Photo.destroy_all

ph1 = Photo.create! title: 'Wentworth Falls', image: 'wentworthfalls_yfauvc'
ph2 = Photo.create! title: 'Mandarin Duck', image: 'mandarinduck_gvzodd'
ph3 = Photo.create! title: 'Angry Boi', image: 'quack_ude9yu'

puts "Created #{Photo.count} photo(s)"

p1.photos << ph1
p2.photos << ph2
p3.photos << ph3
