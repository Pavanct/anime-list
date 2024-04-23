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
class AnimeListSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :animes
end
