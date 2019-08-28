class Artist < ApplicationRecord
    has_many :keyboards 

    validates :name, presence: true 
    validates :name, uniqueness: true
end
