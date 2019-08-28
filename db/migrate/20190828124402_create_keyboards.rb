class CreateKeyboards < ActiveRecord::Migration[6.0]
  def change
    create_table :keyboards do |t|
      t.string :make 
      t.string :model 
      t.integer :inventory 
      t.boolean :for_sale, default: false 
      t.integer :artist_id 

      t.timestamps
    end
  end
end
