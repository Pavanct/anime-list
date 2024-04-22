class AnimeSerializer < ActiveModel::Serializer
  attributes :id, :title, :genre, :anime_type, :episode_count, :rating
end
