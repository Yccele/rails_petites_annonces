class AdvertisementsController < ApplicationController

  # Avant create, new et destroy : il faut s'authentifier
  before_action :authenticate_user!, only: [:create, :new, :destroy]

  def index
    # .validated : scope, voir model
    @advertisements = Advertisement.validated
    @advertisements_no = Advertisement.no_validated
  end

  def show
    @comment = Comment.new
    if advertisement.present?
      # = if advertisement != []
      @advertisement = advertisement.first
    else
      redirect_to advertisements_path, flash: { error: "Annonce non trouvée !!" }
    end
  end

  def new
    @advertisement = Advertisement.new
  end

  def create
    ad = Advertisement.new(ad_params)
    # current_user : défini avec la gem devise
    ad.user_id =  current_user.id
    if ad.save
      redirect_to advertisements_path, flash: { notice: "Annonce ajoutée avec succès" }
    else
      render :new, flash: { error: "Erreur" }
    end
  end

  def destroy
    Advertisement.find(params[:id]).delete
    redirect_to advertisements_path, flash: { notice: "Annonce supprimée avec succès" }
  end

  # Ici, on définit du code pour le réutiliser (DRY)
  # toutes les fonctions définies sous private ne pourront être associées à une route
  private

  def advertisement
    Advertisement.where(id: params[:id])
  end

  def ad_params
    params.require(:advertisement).permit(:content, :title, :price)
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

end