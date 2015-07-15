class EventsController < ApplicationController
    def index
      @user = current_user
      @date = Date.today
      @events = Event.all.where("user_id = ?, current_user.id && date = @date")
    end

    def new
      @sources = Source.all
      @event = Event.new
    end

    def create

      @user = current_user
      @event = @user.events.new(event_params)
      @event.save
      redirect_to ('/')
      end

      def destroy
        @event = Event.find(params[:id])
        @event.destroy
        redirect_to '/'
      end


  private
    def event_params
      params.require(:event).permit(:date, :source_id)
    end


end
