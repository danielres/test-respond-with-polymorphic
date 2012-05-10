class CommentsController < ApplicationController
  respond_to :html

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to :back, :notice => :ok
  end


  def create
    @comment = Comment.new(params[:comment])
    flash[:notice] = "Comment was created successfully." if @comment.save
    redirect_to :back
  end


end
