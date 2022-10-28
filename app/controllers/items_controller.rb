class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    
  
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end


  private

  def item_params
    params.require(:item).permit(:image,:item_name,:item_discribe,:category_id,:state_id,:postage_id,:scheduled_day_id,:ship_id,:item_price).merge(user_id: current_user.id)
  end
end
