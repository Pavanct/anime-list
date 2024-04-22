# == Schema Information
#
# Table name: anime_lists
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class AnimeList < ApplicationRecord
  belongs_to :user
  has_many :user_animes, dependent: :destroy
  has_many :animes, through: :user_animes

  validates :user_id, presence: true
  validates :name, presence: true, uniqueness: { scope: :user_id }
end
