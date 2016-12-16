class EmployeeRequestsController < ApplicationController
  before_filter :authenticate_admin!, only: [:index, :show, :destroy]

  def index
    @employee_requests = EmployeeRequest.all
  end

  def new
    @employee_request = EmployeeRequest.new
  end

  def create
    @employee_request = EmployeeRequest.new(employee_params)
    if @employee_request.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @employee_request = EmployeeRequest.find_by_id(params[:id])
  end

  def destroy
    @employee_request = EmployeeRequest.find_by_id(params[:id])
    @employee_request.destroy
    redirect_to employee_requests_path
  end

  private

  def employee_params
    params.require(:employee_request).permit(:name, :email, :telephone, :qualification, :description)
  end

end
