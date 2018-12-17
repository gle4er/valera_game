class ItemsController < ApplicationController
  def show
    @valera = current_user.valera
    @items = @valera.items
  end

  def create
    @valera = current_user.valera
    @item = Item.find params["item"]["id"]
    @valera.money -= @item.money
    @valera.items << @item
  end

  def new
    @item_list = Item.all
    @item = Item.new
  end
end
