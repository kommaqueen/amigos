class CommentsController < ApplicationController

  def create
    @place = Place.find(params[:place_id])
    @comment = Comment.new(comment_params)
    @comment.place = @place
    @comment.user = current_user
    if @comment.save
      redirect_to place_path(@place)
    else
      render "places/show", status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end


end
