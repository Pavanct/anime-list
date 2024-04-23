class ChangeEmailToNotNull < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :email, :not_null, default: ""
  end
end
