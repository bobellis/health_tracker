class UsersController < ApplicationController

  helper_method :sort_column, :sort_direction

  def show
    @sources = Source.search(params[:search])
    @sources = @sources.order(sort_column + " " + sort_direction)
    @user = current_user
    @events = @user.events
  end

private
  def sort_column
    params[:sort] || "name"
  end

  def sort_direction
    params[:direction] || "asc"
  end

end
