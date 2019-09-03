class KeyboardsController < ApplicationController
    def index
      if params[:artist_id]
        @keyboards = Keyboard.all.where("artist_id = ?", params[:artist_id])
      else
        @keyboards = Keyboard.all
      end
    end
  
    def new
      if params[:artist_id] && !Artist.exists?(params[:artist_id])
        redirect_to store_path, alert: "Artist not found."
      elsif params[:artist_id] && Artist.exists?(params[:artist_id])
        @keyboard = Keyboard.new(artist_id: params[:artist_id])
      else
        @keyboard = Keyboard.new
      end
    end
  
    def create
      @keyboard = current_user.keyboards.new(keyboard_params)
  
      if @keyboard.save
        redirect_to keyboard_path(@keyboard)
      else
        render :new
      end
    end
  
    def show
      @keyboard = Keyboard.find(params[:id])
    end
  
    def edit
      @keyboard = current_user.keyboards.find_by(id: params[:id])
      if !@keyboard
        redirect_to keyboards_path
      end
    end
  
    def update
      @keyboard = current_user.keyboards.find(params[:id])
  
      @vinyl.update(keyboard_params)
  
      if @keyboard.save
        redirect_to keyboard_path(@keyboard)
      else
        render :edit
      end
    end
  
    def destroy
      Keyboard.find(params[:id]).destroy
      redirect_to my_keyboards_path
    end
  
    def my_keyboards
      @keyboards = Keyboard.my_keyboards(current_user)
      render :index
    end
  
    private
  
    def keyboard_params
      params.require(:keyboard).permit(:make, :model, :inventory, :for_sale, :artist_id, artist_attributes: [:name])
    end
  end
  