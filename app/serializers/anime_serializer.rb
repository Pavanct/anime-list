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
class AnimeSerializer < ActiveModel::Serializer
  attributes :id, :title, :genre, :anime_type, :episode_count, :rating
end
