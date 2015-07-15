class UsersController < ApplicationController
  def show
    @sources = Source.all
    @user = current_user
    @events = @user.events
  end
end
