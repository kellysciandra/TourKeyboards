class StoreController < ApplicationController
    def index
      @keyboards = Keyboard.for_sale_exclude_current_user(current_user)
    end
  end
  