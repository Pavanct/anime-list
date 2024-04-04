class Anime < ApplicationRecord
  # validations
  validates :title, presence: true
  validates :genre, presence: true
end
