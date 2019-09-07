class AddPriceToKeyboards < ActiveRecord::Migration[6.0]
  def change
    add_column :keyboards, :price, :integer
  end
end
