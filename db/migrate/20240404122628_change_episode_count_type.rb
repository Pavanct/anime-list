class ChangeEpisodeCountType < ActiveRecord::Migration[6.1]
  def change
    change_column :animes, :episode_count, :integer
  end
end
