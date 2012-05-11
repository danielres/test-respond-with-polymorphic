class TagsController < ApplicationController
  respond_to :html, :json
  def index
    @tags = Tag.order(:name)
    respond_to do |format|
      format.html
      format.json { render json: @tags.tokens(params[:q]) }
    end  end

  def show
    @tag = Tag.find(params[:id])
    respond_with @tag
  end
end
