class CommentsController < ApplicationController

  def create
    comment_record = Comment.new(comment_params).tap do |comment|
      comment.advertisement_id = advertisement_id
      comment.user_id = current_user.id
    end
    if comment_record.save
      redirect_to advertisement_path(advertisement_id), flash: { notice: "Commentaire ajouté avec succès" }
    else
      render :new, flash: { error: "Erreur" }
    end
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to advertisement_path(advertisement_id), flash: { notice: "Commentaire supprimé avec succès" }
  end


  private

  def advertisement_id
    params[:advertisement_id]
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

end

