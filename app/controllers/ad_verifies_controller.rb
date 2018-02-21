class AdVerifiesController < ApplicationController

  def index
    @advertisements = Advertisement.no_validated
  end

  def update
    ad = Advertisement.find(params[:id])
    ad.update(is_validate: true)
    redirect_to ad_verifies_path
  end

  def destroy
    Advertisement.find(params[:id]).destroy
    redirect_to ad_verifies_path
  end

end