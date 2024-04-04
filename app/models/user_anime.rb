class UserAnime < ApplicationRecord
  belongs_to :user
  belongs_to :anime

  validates :user_id, presence: true
  validates :anime_id, presence: true
  validates :episodes_watched, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
