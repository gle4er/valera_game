class ItemsController < ApplicationController
  before_action :authenticate_user!

  before_action do |controller|
    @valera = current_user.valera
  end

  def show
    @valera.items.each do |i|
      p i
    end
  end

  def create
    @item = Item.find params["id"]
    if @valera.money < @item.money
      flash[:alert] = "Not enough money"
    else
      @valera.money -= @item.money
      @valera.items << @item
      @valera.save
      flash[:notice] = "Item is added to inventory"
    end
    redirect_to action: 'new'
  end

  def destroy
    @item_id = params["item_id"]
    @items = @valera.items.where("item_id = #{@item_id}").to_a
    @stats = @items.first.stats
    @stats.each do |stat, value|
      if !value.nil?
        new_value = @valera.send(stat.to_s)
        new_value += value
        @valera.send(stat.to_s + '=', new_value)
      end
    end
    @valera.save
    @valera.items.delete @item_id
    @items.pop
    @valera.items << @items
    flash[:notice] = "Item is used"
    redirect_to action: 'show'
  end

  def new
    @item_list = Item.all
  end
end
