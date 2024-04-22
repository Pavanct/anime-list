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
#
class UserAnime < ApplicationRecord
  belongs_to :user
  belongs_to :anime
end
