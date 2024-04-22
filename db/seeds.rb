# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
require 'csv'

Rails.application.config.seed_data = if Rails.env.development?
    [
    { name: "John Doe", email: "johndoe@example.com" },  # Add more users as needed
].each do |user_data|
  User.create!(user_data)
end
else
  []
end

# Seed data for Animes
csv_text = File.read(Rails.root.join('lib', 'seeds', 'anime.csv'))
csv = CSV.parse(csv_text, headers: true)

csv.each do |row|
  Anime.create!(
    id: row['anime_id'],
    title: row['name'],
    genre: row['genre'],
    anime_type: row['type'],
    episode_count: row['episodes'],
    rating: row['rating']
  )
end

if Rails.env.development? && Rails.application.config.seed_data.present?
  user = User.first
  animes = Anime.all
  animes.each do |anime|
    if user.present? and anime.episode_count.present?
      UserAnime.create!(user: user, anime: anime, episodes_watched: rand(0..anime.episode_count))
    else
      # Handle the case where episode_count is nil or empty (log a message, skip creation)
      puts "Skipping UserAnime creation for #{anime.title} due to missing episode count."
    end
  end
end
