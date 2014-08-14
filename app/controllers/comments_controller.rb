class CommentsController < ApplicationController

  def create
    @bourbon = Bourbon.find_by(slug: params[:bourbon_id])
    @bourbon.comments.create(comment_params)
    redirect_to @bourbon
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def destroy
    comment = Comment.find(params[:id])
    bourbon = comment.bourbon
    comment.destroy
    redirect_to bourbon
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user: current_user)
  end
end
