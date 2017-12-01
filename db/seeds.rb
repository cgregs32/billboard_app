15.times do |n|
  name = Faker::BossaNova.artist
  genre = ['Rock', 'Pop', 'Classic', 'Country', 'Dance']
  Artist.create!(name: name, genre: genre)
end

25.times do |n|
  name = Faker::BossaNova.song
  rank = rand(1..25)
  artist_id = rand(1..15)
  Song.create(name: name, rank: rank, artist_id: artist_id)
end
