class CreateLineItems < ActiveRecord::Migration[6.0]
  def change
    create_table :line_items do |t|
      t.integer :cart_id
      t.integer :keyboard_id
      t.integer :quantity

      t.timestamps
    end
  end
end
