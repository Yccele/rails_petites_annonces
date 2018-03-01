class HomesController < ApplicationController

  def index
    if search_params.empty?
      @advertisements = Advertisement.validated
    else
      xx
      @advertisements = Category.find(search_params).advertisements.validated
    end
    #@advertisements = Advertisement.where(is_validate: true)
  end

  private

  def search_params
    params[:search][:category_id]
  end
end