class GossipsController < ApplicationController
  def index
  	@gossips = Gossip.all
  end

  def create
  	@user = User.create(first_name: params[:gossip_user])
  	@gossip = Gossip.create(content: params[:gossip_content], user_id: @user.id, title: params[:gossip_title])
  		if @gossip.save
  			redirect_to gossips_path
        flash[:success] = "Gossip is validate !" 
  		else
        flash[:danger] = "Invalid title or content"
  			render :new
  		end
  end

  def show
    @gossip = Gossip.find(params[:id])
  end

end
