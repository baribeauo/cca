class EventsController < ApplicationController
	def index
		@events = Event.all
		@date = params[:month] ? Date.parse(params[:month]) : Date.today
	end

	def new
		@event = Event.new
	end

	def create
		@event = Event.new(params[:event])
		@event.date_of_event = Time.now
		@event.save
		redirect_to :back
	end
end
