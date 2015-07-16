class EventsController < ApplicationController
    def index
      @user = current_user
      @date = Date.today
      @events = Event.all.where("user_id = ?, current_user.id && date = @date")
      @total = 0
    end

    def new
      @sources = Source.all
      @event = Event.new
    end

    def create

      @user = current_user
      @event = @user.events.new(event_params)
      @event.save
      respond_to do |format|
        format.html {redirect_to '/'}
        format.js
      end
    end


      def destroy
        @event = Event.find(params[:id])
        @event.destroy
        redirect_to '/'
      end

      def quickadd
      end


  private
    def event_params
      params.require(:event).permit(:event_date, :source_id)
    end


end
