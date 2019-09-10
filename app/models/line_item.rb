class LineItem < ApplicationRecord
    belongs_to :keyboard
    belongs_to :cart 
end
