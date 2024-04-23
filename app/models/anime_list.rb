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

  def update_animes(anime_ids, user_id)
    current_anime_ids = animes.pluck(:id)
    new_anime_ids = anime_ids.map(&:to_i)

    animes_to_add = new_anime_ids - current_anime_ids
    animes_to_remove = current_anime_ids - new_anime_ids

    animes_to_add.each do |anime_id|
      UserAnime.create(anime_list: self, anime_id: anime_id, user_id: user_id)
    end

    user_animes.where(anime_id: animes_to_remove).destroy_all
  end
end
