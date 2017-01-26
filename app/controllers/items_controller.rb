class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(
      item_params
    )

    if @item.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(
      :name,
      :description,
      :theme_id,
      :seed_min,
      :seed_max
    )
  end
end
