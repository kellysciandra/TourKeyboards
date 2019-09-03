class AddDefaultInventoryToKeyboard < ActiveRecord::Migration[6.0]
  def change
    change_column :keyboards, :inventory, :integer, :default => 1
  end
end