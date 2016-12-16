class ApplyTutionsController < ApplicationController

  before_filter :authenticate_admin!, only: [:index, :com_index, :show, :destroy]

  def index
    @tutions = []
    @events = Event.where("exam_type=?", "Acadamic")
    @events.each do |event|
      event.apply_tutions.each do |ap|
        @tutions << ap
      end
    end
    @tutions
  end

  def com_index
    @tutions = []
    @events = Event.where("exam_type=?", "Compitative")
    @events.each do |event|
      event.apply_tutions.each do |ap|
        @tutions << ap
      end
    end
    @tutions
  end

  def new
    @apply_tution = ApplyTution.new
  end

  def create
    @apply_tution = ApplyTution.new(apply_tution_params)
    if @apply_tution.save
      redirect_to user_events_path
    else
      render 'new'
    end
  end

  def show
    @apply_tution = ApplyTution.find_by_id(params[:id])
  end

  def destroy
    @apply_tution = ApplyTution.find_by_id(params[:id])
    @apply_tution.destroy
    redirect_to apply_tutions_path
  end

  private

  def apply_tution_params
    params.require(:apply_tution).permit(:name, :s_class, :collage, :percentage, :telephone, :place, :description, :event_id)
  end
end
