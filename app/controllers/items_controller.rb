class ItemsController < ApplicationController
  before_action :authenticate_user!

  before_action do |controller|
    @valera = current_user.valera
  end

  def show
    @items = @valera.items
  end

  def create
    @item = Item.find params["id"]
    if @valera.money < @item.money
      flash[:notice] = "Not enough money"
    else
      @valera.money -= @item.money
      @valera.items << @item
      @valera.save
      flash[:notice] = "Item is added to inventory"
    end
    redirect_to action: 'new'
  end

  def destroy
    @item_id = params["id"]
    @item = @valera.items[@item_id]
    @valera.items.delete @item
  end

  def new
    @item_list = Item.all
  end
end
