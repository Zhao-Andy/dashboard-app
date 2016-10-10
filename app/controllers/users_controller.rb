class UsersController < ApplicationController
  before_action :current_user
  def create
    @user = User.create(
      email: params[:email],
      name: params[:name],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if @user.valid?
      flash[:success] = 'User created'
      redirect_to '/login'
    else
      flash[:danger] = @user.errors.full_messages
      render 'new'
    end
  end

  def show
    @user = User.new
  end

  def update
    @user = User.find_by(params[:id])
    if @user.update(
      email: params[:email],
      name: params[:name],
      password_digest: params[:password],
      password_confirmation: params[:password_confirmation]
    )
      flash[:success] = 'Successfully updated your account!'
      redirect_to '/'
    else
      flash[:danger] = @user.errors.full_messages
      render 'edit'
    end
  end

  def show
    @user = User.find_by(id: current_user.id)
  end
end
