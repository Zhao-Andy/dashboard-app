class Api::EmployeesController < ApplicationController
  before_action :current_user
  before_action :authenticate_user!
  skip_before_filter :verify_authenticity_token

  def index
    @employees = Employee.where(user_id: current_user.id)
  end

  def create
    @employee = Employee.create(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      hiring_date: params[:hiring_date],
      user_id: current_user.id
    )
    if @employee.valid?
      render json: @employee, status: 200
    else
      render json: @employee.errors.full_messages, status: 422
    end
  end

  def update
    @employee = Employee.find_by(id: params[:id])
    if @employee.update(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      hiring_date: params[:hiring_date]
    )
      flash[:success] = "Updated #{@employee.full_name}!"
      redirect_to '/'
    else
      flash[:danger] = @employee.errors.full_messages
      render "/employee/#{@employee.id}"
    end
  end

  def destroy
    @employee = Employee.find_by(id: params[:id])
    @employee.destroy
  end
end
