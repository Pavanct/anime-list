class ChangeAnimes < ActiveRecord::Migration[6.0]
  def change
    add_column :animes, :anime_type, :string
    add_column :animes, :rating, :float
    remove_column :animes, :synopsis
    remove_column :animes, :image_url
  end
end
