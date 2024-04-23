class ChangeEmailToStringNotNull < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :email, :string, null: false, default: ""
  end
end
