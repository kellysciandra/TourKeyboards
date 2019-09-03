class Keyboard < ApplicationRecord
    belongs_to :artist, required: false
    has_many :line_items
    has_many :carts, through: :line_items
    belongs_to :user, required: false
  
    validates :make, presence: true
    validates :make, uniqueness: true
    validates :model, presence: true
    validates :model, uniqueness: true
    validates :price, presence: true
    validates :inventory, presence: true
  
    def self.for_sale
      Keyboard.where("for_sale = ? AND inventory > ?", true, 0)
    end
  
    def self.for_sale_exclude_current_user(user)
      Keyboard.where.not("user_id = ?", user.id) & Keyboard.for_sale
    end
  
    def self.my_keyboards(user)
      Keyboard.where("user_id = ?", user.id)
    end
  
    def for_sale_display
      self.for_sale ? "yes" : "no"
    end
  
    def in_stock
      self.inventory > 0
    end
  
    def artist_attributes=(artist_attributes)
      if artist_id
        artist = Artist.find(artist_id)
      else
        artist = Artist.find_or_create_by(artist_attributes)
      end  
      self.artist = artist
    end
  
  end
  