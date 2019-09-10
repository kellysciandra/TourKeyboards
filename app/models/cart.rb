class Cart < ApplicationRecord
  has_many :line_items
  has_many :keyboards, through: :line_items
  belongs_to :user

  def add_item(keyboard_id)
    line_item = self.line_items.find_by(keyboard_id: keyboard_id)

    if line_item
      line_item.quantity += 1
    else
      line_item = self.line_items.build(keyboard_id: keyboard_id)
    end

    self.update_inventory(keyboard_id) if line_item.keyboard.in_stock
    line_item.save
  end

  def update_inventory(keyboard_id, qty=1)
    keyboard = Keyboard.find(keyboard_id)
    keyboard.inventory -= qty if qty <= keyboard.inventory
    keyboard.for_sale = false if keyboard.inventory < 1
    keyboard.save
  end

  def total
    total = 0
    self.line_items.each do |line_item|
      keyboard = Keyboard.find(line_item.keyboard_id)
      total += (keyboard.price * line_item.quantity)
    end
    total
  end
end
