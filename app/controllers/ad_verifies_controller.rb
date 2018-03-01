class AdVerifiesController < ApplicationController

  def index
    @advertisements = Advertisement.no_validated
    # if @advertisements.present?
    #   redirect_to ad_verifies_path
    # else
    #   redirect_to advertisements_path, flash: { ad_empty: "Il n'y a aucune annonce à vérifier." }
    # end
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