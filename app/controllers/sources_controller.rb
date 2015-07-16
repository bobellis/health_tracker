class SourcesController < ApplicationController

  def index
    @sources = Source.order(sort_column + " " + sort_direction)
  end

  def new
    @source = Source.new
  end

  def create
    @user = current_user
    @source = Source.new(source_params)
    if @source.save
      redirect_to ('/')
    else
      render :new
    end
  end

  def destroy
    @source = Source.find(params[:id])
    @source.destroy
    redirect_to '/'
  end

  private
  def source_params
    params.require(:source).permit(:name, :source_type, :calories)
  end

  def sort_column
    params[:sort] || "name"
  end

  def sort_direction
    params[:direction] || "asc"
    # %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
