# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

lisa = User.create({email: "lisasimpson@ga.com", first_name: "Lisa", last_name: "Simpson", password: "password", image_url: "http://upload.wikimedia.org/wikipedia/en/e/ec/Lisa_Simpson.png"})
bart = User.create({email: "bartsimpson@ga.com", first_name: "Bart", last_name: "Simpson", password: "password",image_url: "http://img4.wikia.nocookie.net/__cb20110819022447/simpsons/images/5/53/Bart-simpson-prank-phone-call.jpg"})
marge = User.create({email: "margesimpson@ga.com", first_name: "Marge", last_name: "Simpson", password: "password",image_url: "http://upload.wikimedia.org/wikipedia/en/0/0b/Marge_Simpson.png"})
homer = User.create({email: "homersimpson@ga.com", first_name: "Homer", last_name: "Simpson", password: "password",image_url: "http://upload.wikimedia.org/wikipedia/en/0/02/Homer_Simpson_2006.png"})
ned = User.create({email: "nedflanders@ga.com", first_name: "Ned", last_name: "Flanders", password: "password",image_url: "http://upload.wikimedia.org/wikipedia/en/8/84/Ned_Flanders.png"})

lol = lisa.posts.create({title: "Labor of Love", body: "I love homework"})
hw = bart.posts.create({title: "Homework", body: "I hate homework"})

aboutlisa = lisa.pages.create({name: "Lisa Simpson", content: "Younger sister to Bart and over-achiever at Springfield Elementary School."})
aboutbart = bart.pages.create({name: "Bart Simpson", content: "Older brother to Lisa and eternal 4th grade student at Springfield Elementary School."})

hw.comments.create({content: "So immature!"})
lol.comments.create({content: "Cowabunga dude!"})

hw.tags.create({name: "redundant"})
lol.tags.create({name: "educational"})
