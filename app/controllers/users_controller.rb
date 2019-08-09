class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create

    @user = User.new(password: params[:password], password_confirmation: params[:password_confirmation],first_name:params[:first_name], last_name:params[:last_name], email:params[:email], description:params[:description], age:params[:age], city: City.find(params[:city]) )
    if @user.save
      log_in @user
      flash[:success] = "User successfully created"
      redirect_to gossips_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
