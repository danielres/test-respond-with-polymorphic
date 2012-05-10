class TaggingsController < ApplicationController

  def create
    @tag = Tag.find_or_create_by_name(params[:tagging][:tag][:name])
    @taggable = class_eval(params[:tagging][:taggable_type]).find(params[:tagging][:taggable_id])
    begin
      @taggable.tags << @tag
      flash[:notice] = "Tagging was created successfully."
    rescue
      flash[:error]  = "Could not create this tag association, maybe it was already existing ?"
    end
    redirect_to :back
  end

  def destroy
    tagging = Tagging.find(params[:id])
    flash[:notice] = "Tagging was removed successfully." if tagging.destroy
    redirect_to :back
  end

end
