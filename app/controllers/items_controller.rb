class ItemsController < ApplicationController
  before_action :authenticate_user!,except: [:index,:show]
  before_action :contributor_confirmation, only: [:edit]
  before_action :set_item, only: [:show,:edit]

  def edit 
  end

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def show  
  end

  def create
    @item = Item.new(item_params)
      if @item.save
        redirect_to root_path
      else
        render :new, status: :unprocessable_entity
      end
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
      if @item.save
        redirect_to item_path(@item)
      else
        render :edit
      end
  end

  private

  def item_params
    params.require(:item).permit(:image,:item_name,:item_discribe,:category_id,:state_id,:postage_id,:scheduled_day_id,:ship_id,:item_price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def contributor_confirmation
    redirect_to root_path unless current_user == Item.find(params[:id]).user
  end 

end
