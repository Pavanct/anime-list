# == Schema Information
#
# Table name: user_animes
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  anime_id         :integer
#  episodes_watched :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  anime_list_id    :integer          not null
#
class UserAnime < ApplicationRecord
  belongs_to :user
  belongs_to :anime
  belongs_to :anime_list

  validates :user_id, presence: true
  validates :anime_id, presence: true
  validates :anime_list_id, presence: true
end
