# == Schema Information
#
# Table name: animes
#
#  id            :integer          not null, primary key
#  title         :string
#  genre         :string
#  episode_count :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  anime_type    :string
#  rating        :float
#
class Anime < ApplicationRecord
  # validations
  validates :title, presence: true
  validates :genre, presence: true
end
