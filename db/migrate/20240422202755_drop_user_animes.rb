class DropUserAnimes < ActiveRecord::Migration[6.0]
  def up
    drop_table :user_animes
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end