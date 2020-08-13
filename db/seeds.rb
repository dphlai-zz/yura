puts "Creating posts..."
Post.destroy_all

p1 = Post.create! title: 'Amazing day at Lane Cove National Park', caption: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
p2 = Post.create! title: 'Incredible day hike at Ku-ring-gai!', caption: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
p3 = Post.create! title: 'The views are worth the effort', caption: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
p4 = Post.create! title: 'Breathtaking', caption: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
p5 = Post.create! title: 'Sydney pulling through once again', caption: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
p6 = Post.create! title: '11/10', caption: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
p7 = Post.create! title: 'Woah', caption: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
p8 = Post.create! title: 'Cooooooool', caption: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
p9 = Post.create! title: 'Bloody fantastic', caption: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'

puts "Created #{Post.count} post(s)."

# ------------------------------------------------------------------------------

puts "Creating users..."
User.destroy_all

u1 = User.create! name:'Danny', email: 'danny@ga.co', password: 'chicken'
u2 = User.create! name:'Luke', email: 'luke@ga.co', password: 'chicken'
u3 = User.create! name:'Goose', email: 'goose@ga.co', password: 'chicken'

puts "Created #{User.count} user(s)."

u1.posts << p1 << p2 << p3 << p4
u2.posts << p5 << p6 << p7
u2.posts << p8 << p9

print "User #{User.first.name} has the following posts: "
puts User.first.posts.pluck(:title).join(', ')

# ------------------------------------------------------------------------------

puts "Creating hikes..."
Hike.destroy_all


h1 = Hike.create! name:'Great North Walk', description: 'Passing through Lane Cove National Park, this multi-day hike offers stunning scenery across Sydney, the Hunter Valley and Newcastle. Tackle part of the track for an easy day walk.'

h2 = Hike.create! name:'Bairne Walking Track', description: 'Bairne walking track starts from West Head Road, passing through heathlands of banksia, boronia and grevillea. Look for nectar-loving yellow-faced honeyeaters and the vibrant variegated wren. After around 2.5km, you\'ll reach an intersection. Head south for 1km to Towlers Bay lookout, for magnificent views of Towlers Bay and Pittwater.'

h3 = Hike.create! name:'Wentworth Falls', description: 'This short but steep walk from Wentworth Falls picnic area is well worth the effort. Follow the level path past Jamison and Wentworth lookouts before descending around 200 steps to the cliff-edge Fletchers lookout. Marvel at the waterfall that gives Wentworth Falls its name, as it plunges 100m to the valley floor.'

puts "Created #{Hike.count} hike(s)."

h1.posts << p1 << p4 << p7
h2.posts << p2 << p5 << p8
h3.posts << p3 << p6 << p9

# ------------------------------------------------------------------------------

puts "Loading photos..."
Photo.destroy_all

ph1 = Photo.create! title: 'Mandarin Duck', image: 'mandarinduck_gvzodd'
ph2 = Photo.create! title: 'Angry Boi', image: 'quack_ude9yu'
ph3 = Photo.create! title: 'Wentworth Falls', image: 'wentworthfalls_yfauvc'
ph4 = Photo.create! title: 'Wentworth Falls!', image: 'wentworthfalls2_e9lluu'
ph5 = Photo.create! title: 'Sunset at Wentworth Falls', image: 'bluemountains_wvokqx'
ph6 = Photo.create! title: 'Blue Mountains sunset', image: 'wentworthfalls3_pj4mnl'
ph7 = Photo.create! title: 'Slack Stairs waterfall', image: 'slackstairs_u8ezme'
ph8 = Photo.create! title: 'Great North Walk trail', image: 'greatnorthwalk_scx66p'
ph9 = Photo.create! title: 'Great North Walk', image: 'greatnorthwalk2_ailstv'
ph10 = Photo.create! title: 'Lane Cove National Park dinghies', image: 'lanecove_qo1wam'
ph11 = Photo.create! title: 'Kuringgai waterfall', image: 'kuringgai_diuklj'


puts "Created #{Photo.count} photo(s)"

p1.photos << ph8
p2.photos << ph11
p3.photos << ph3
p4.photos << ph9
p5.photos << ph1
p6.photos << ph6
p7.photos << ph2
p8.photos << ph10
p9.photos << ph4 << ph7 << ph5
