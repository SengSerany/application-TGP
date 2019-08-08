class GossipsController < ApplicationController
  before_action :authenticate_user, only: [:show]

  def index
  	@gossips = Gossip.all
  end

  def new
    @gossip = Gossip.new
  end

  def create
#    @city = City.create(name: params[:city_name])
 # 	@user = User.create(first_name: params[:gossip_user], city_id: @city.id)
    
    @gossip = Gossip.create(content: params[:gossip_content], title: params[:gossip_title])
      @gossip.user = User.find_by(id: session[:user_id])
  		if @gossip.save
  			redirect_to gossips_path
        flash[:success] = "Gossip is validate !" 
  		else
        flash[:danger] = "Invalid title or content."
  			render :new
  		end
  end

  def show
    @gossip = Gossip.find(params[:id])
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    if @gossip.update(post_params)
      redirect_to @gossip
      flash[:success] = "The gossips has been update succefully."
    else
      flash[:danger] = "An error has happened, try again."
      render :edit
      end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to gossips_path
  end

  def post_params
    params.require(:gossip).permit(:title, :content)
  end
end

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end