class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @purchase_shipping = PurchaseShipping.new
    @item = Item.find(params[:item_id])
    if @item.purchases.exists?
      redirect_to root_path
    elsif @item.user != current_user
      render :index, status: :unprocessable_entity
    else
      redirect_to root_path
    end
  end

  def create
    @purchase_shipping = PurchaseShipping.new(purchase_params)
    @item = Item.find(params[:item_id])
    if @purchase_shipping.valid?
      pay_item
      @purchase_shipping.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def purchase_params
    params.require(:purchase_shipping).permit(:post_code, :prefecture_id, :municipalities, :street_address, :building_name, :telephone).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = "sk_test_b2a5683d80f987422b1f3def" 
    item = Item.find(params[:item_id])
    amount = item.price
    Payjp::Charge.create(
      amount: amount,  # 商品の値段
      card: purchase_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

end
