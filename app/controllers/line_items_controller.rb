class LineItemsController < ApplicationController
  def create
    current_cart.add_item(params[:keyboard_id])
    if current_cart.save
      redirect_to cart_path(current_cart), {notice: 'Item added to cart!'}
    else
      redirect_to store_path, {alert: 'Item was not added. Please check inventory.'}
    end
  end

  def edit
    @line_item = LineItem.find(params[:id])
    render 'carts/edit'
  end

  def update
    lineitem = LineItem.find(params[:id])
    keyboard = lineitem.keyboard
    new_qty = params[:line_item][:quantity].to_i

    qty_update = new_qty - lineitem.quantity

    if keyboard.inventory >= qty_update
      if lineitem.update(lineitem_params)
        current_cart.update_inventory(keyboard.id, qty_update)
        redirect_to cart_path(current_cart), {notice: 'Item quantity was updated!'}
      else
        redirect_to store_path, {alert: 'Item quantity was not updated. Please check inventory.'}
      end
    else
      redirect_to cart_path(current_cart), {alert: 'Item quantity was not updated. Please check inventory.'}
    end
  end

  private

  def lineitem_params
    params.require(:line_item).permit(:quantity)
  end

end
