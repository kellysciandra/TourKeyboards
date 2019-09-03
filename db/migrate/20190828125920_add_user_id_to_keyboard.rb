class AddUserIdToKeyboard < ActiveRecord::Migration[6.0]
  def change
    add_column :keyboards, :user_id, :integer
  end
end
