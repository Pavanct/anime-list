class CreateAnimeLists < ActiveRecord::Migration[6.1]
  def change
    create_table :anime_lists do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
