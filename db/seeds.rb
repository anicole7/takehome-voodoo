# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

if Game.count == 0
  Game.create([
    {
      publisher_id: 'fda4848f-9fe6-4703-8f66-544cc146f1ae',
      name: 'Helix Jump',
      platform: 'ios',
      store_id: '1345968745',
      bundle_id: 'com.h8games.falldown',
      app_version: '2.4.2',
      is_published: true,
    },
    {
      publisher_id: 'fda4848f-9fe6-4703-8f66-544cc146f1ae',
      name: 'Helix Jump',
      platform: 'android',
      store_id: 'com.h8games.helixjump',
      bundle_id: 'com.h8games.helixjump',
      app_version: '2.4.4',
      is_published: true,
    },
    {
      publisher_id: 'fda4848f-9fe6-4703-8f66-544cc146f1ae',
      name: 'Swing Rider',
      platform: 'ios',
      store_id: '1441881688',
      bundle_id: 'com.semeevs.swingrider',
      app_version: '1.3',
      is_published: true,
    },
    {
      publisher_id: 'fda4848f-9fe6-4703-8f66-544cc146f1ae',
      name: 'Swing Rider',
      platform: 'android',
      store_id: 'com.swing.rope',
      bundle_id: 'com.swing.rope',
      app_version: '1.0.3',
      is_published: true,
    },
    {
      publisher_id: 'c92d2e46-4f85-485c-b2a2-591d7857c93e',
      name: 'Car Crash!',
      platform: 'ios',
      store_id: '1450509345',
      bundle_id: 'com.andrew.stunts',
      app_version: '1.3.1',
      is_published: true,
    }
  ])
end

