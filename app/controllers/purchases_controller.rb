class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item

  def index
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def purchase_params
    params.permit(:zip_code, :area_id, :city, :address_line, :building_name, :tell)
          .merge(user_id: current_user.id, item_id: @item.id)
  end
end
