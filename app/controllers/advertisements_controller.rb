class AdvertisementsController < ApplicationController

  # il faut s'authentifier, sauf pour le show
  before_action :authenticate_user!, except: [:show]

  def index
    @advertisements = current_user.advertisements
  end

  def show
    @comment = Comment.new
    if advertisement.present?
      # = if advertisement != []
      @advertisement = advertisement.first
      @geoloc_hash = {lat: @advertisement.adress.latitude,
                      lng: @advertisement.adress.longitude}
    else
      redirect_to advertisements_path, flash: { error: "Annonce non trouvée !" }
    end
  end

  def new
    @advertisement = Advertisement.new
    @advertisement.build_adress
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

  def update
    @advertisement = Advertisement.find(params[:id])
    @advertisement.update_attributes(ad_params)
    if @advertisement.save
      redirect_to advertisement_path(@advertisement)
    else
      redirect_to edit_advertisement_path(@advertisement)
    end
  end

  def edit
    if advertisement.present?
      # = if advertisement != []
      @advertisement = advertisement.first
    else
      redirect_to advertisements_path, flash: { error: "Annonce non trouvée !!" }
    end
  end

  # Ici, on définit du code pour le réutiliser (DRY)
  # toutes les fonctions définies sous private ne pourront être associées à une route
  private

  def advertisement
    Advertisement.where(id: params[:id])
  end

  def ad_params
    params.require(:advertisement).permit(:content, :title, :price, :image, :category_id, adress_attributes: [:id, :number, :rue, :zip_code, :ville, :country])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

end