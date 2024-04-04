class CreateAnimes < ActiveRecord::Migration[6.1]
  def change
    create_table :animes do |t|
      t.string :title
      t.string :synopsis
      t.string :genre
      t.string :episode_count
      t.string :image_url

      t.timestamps
    end
  end
end
