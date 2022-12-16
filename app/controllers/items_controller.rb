class ItemsController < ApplicationController

  def index
    items = Item.all
    render json: items, include: :user
  end

  def show
    if params[:id]
      user_id = User.find(params[:user_id]) 
      items = user_id.items
      render json: items
    else
      items = Item.all
    end
    render json: { error: "User not found"}, status: :not_found

    
  end


end
