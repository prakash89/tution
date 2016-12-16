class EventsController < ApplicationController

  before_filter :authenticate_admin!, only: [:index, :edit, :update, :show, :destroy]
  def index
    @events = Event.order("updated_at DESC")
  end

  def user_index
    @events = Event.order("updated_at DESC")
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to events_path
    else
      render 'new'
    end
  end

  def edit
    @event = Event.find_by_id(params[:id])
  end

  def update
    @event = Event.find_by_id(params[:id])
    if @event.update_attributes(event_params)
      redirect_to events_path
    else
      render 'edit'
    end
  end

  def show
     @event = Event.find_by_id(params[:id])
  end

  def destroy
    @event = Event.find_by_id(params[:id])
    if @event.destroy
      redirect_to events_path
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :date, :exam_type, :done)
  end
end
