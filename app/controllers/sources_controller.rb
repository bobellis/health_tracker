class SourcesController < ApplicationController

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
end
