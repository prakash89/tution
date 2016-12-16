class WorkshopRequestsController < ApplicationController
  before_filter :authenticate_admin!, only: [:index, :destroy]
  def index
    @workshop_requests = WorkshopRequest.all
  end

  def new
    @workshop_request = WorkshopRequest.new
  end

  def create
    @workshop_request = WorkshopRequest.new(request_params)
    if @workshop_request.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    @workshop_request = WorkshopRequest.find_by_id(params[:id])
    @workshop_request.destroy
    redirect_to workshop_requests_path
  end

  private

  def request_params
    params.require(:workshop_request).permit(:name, :email, :telephone, :collage, :percentage)
  end
end
