class CommentsController < ApplicationController
  before_action :find_commentable

  def index
    @comment = Comment.new
  end

  def show
  end

  def new
  end

  def create
    @comment = @commentable.comments.create(user: User.find(session[:user_id]), commentable: if Gossip.find(params[:gossip_id]), content: comment_params[:content])
    
    if @comment.save
      flash[:success] = "Ton commentaire a bien été posté !"
      redirect_to gossip_path(params[:gossip_id])

    else
      flash[:danger] = "Un problème est survenue, essaye encore !"
      redirect_to gossip_path(params[:gossip_id])
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def find_commentable
    @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
    @commentable = Gossip.find_by_id(params[:gossip_id]) if params[:gossip_id]
  end
end
