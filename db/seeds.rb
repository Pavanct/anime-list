# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
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
[
  { title: "Attack on Titan", synopsis: "...", genre: "Action", episode_count: 25 },
  { title: "My Hero Academia", synopsis: "...", genre: "Action", episode_count: 100 },
].each do |anime_data|
  Anime.create!(anime_data)
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
