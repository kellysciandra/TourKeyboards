require 'spec_helper'

describe Keyboard do 
    it 'can be created' do
        keyboard = Keyboard.create!(make: "My title", model: "The post description", price: "4500")
        expect(keyboad).to be_valid
      end
end 