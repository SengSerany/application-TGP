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
    if City.exists?(:name => params[:city][:city_name])
      @city = City.find_by_name(params[:city][:city_name])
    else
      @city = City.create(name: params[:city][:city_name])

    end
    
      @user = User.create(first_name: params[:first_name], last_name: params[:last_name], age: params[:age], description: params[:description], password: params[:password], email: params[:email], city: @city )
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
