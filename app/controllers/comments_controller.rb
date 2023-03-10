class CommentsController < ApplicationController

  def create
    @place = Place.find(params[:place_id])
    @comment = Comment.new(comment_params)
    @comment.place = @place
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to place_path(@place) }
        format.json
      else
        format.html { render "places/show", status: :unprocessable_entity }
        format.json
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end


end
