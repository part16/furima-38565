class HistoriesController < ApplicationController
  before_action :purchase_check, only: :index
  before_action :set_history, only: [:index, :create]
  before_action :authenticate_user!, only: :index

  def index
    @history_area = HistoryArea.new
  end

  def create
    @history_area = HistoryArea.new(history_params)
    if @history_area.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
      Payjp::Charge.create(
        amount: @item.item_price,  
        card: history_params[:token],   
        currency: 'jpy'               
      )
       @history_area.save
       redirect_to root_path
    else 
      render :index
    end
  end

  def history_params
    params.require(:history_area).permit(:post_code, :ship_id, :city, :address, :building, :phone_number ).merge(user_id: current_user.id,item_id: params[:item_id],token: params[:token])
  end
  def purchase_check
    if Item.find(params[:item_id]).history.present?
      redirect_to root_path
    end
  end
  def set_history
    @item = Item.find(params[:item_id])
  end
end