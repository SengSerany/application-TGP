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
    if City.exists?(:name => params[:city])
      @city = City.find_by_name(params[:city])
    else
      @city = City.create(params[city_params])
    end
      @user = User.new(password: params[:password], password_confirmation: params[:password_confirmation],first_name:params[:first_name], last_name:params[:last_name], email:params[:email], description:params[:description], age:params[:age], city: @city )
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

  def city_params
  params.require(:city).permit(:city_name)
  end
end
