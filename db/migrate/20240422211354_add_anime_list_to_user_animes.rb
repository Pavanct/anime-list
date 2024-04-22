class AddAnimeListToUserAnimes < ActiveRecord::Migration[6.1]
  def change
    add_reference :user_animes, :anime_list, null: false, foreign_key: true
  end
end
