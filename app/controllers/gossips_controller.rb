class GossipsController < ApplicationController
  before_action :authenticate_user_new, only: [:new]
  before_action :authenticate_user_show, only: [:show]
  before_action :authenticate_author, only: [:edit, :update, :destroy]

  def index
    # Méthode qui récupère tous les potins et les envoie à la view index (index.html.erb) pour affichage
  end

  def show
    	@id = params[:id]
  end

  def create
    if params[:title].length > 3 && params[:content].length > 6 && params[:title].length < 15 && params[:content].length < 150
    	@gossip = Gossip.create(title: params[:title], content: params[:content], user: User.find(session[:user_id]))
    	redirect_to '/' and return
    else
      if params[:title].length < 4 
        flash[:danger] = "Titre trop court, veuillez le modifier et réessayer (minimum 3 charactères) !"
      elsif params[:title].length > 15
        flash[:danger] = "Titre trop long, veuillez le modifier et réessayer (maximum 15 charactères) !"
      elsif params[:content].length > 150
         flash[:danger] = "Contenu trop long, veuillez le modifier et réessayer (maximum 150 charactères) !"
      else
        flash[:danger] = "Contenu trop court, veuillez le modifier et réessayer (minimum 6 charactères) !"
      end
    	redirect_to '/gossips/new'
    end
  end

  def new

  end

  def destroy
    redirect_to '/'
  end

  def edit
    @id = params[:id]
  end

  def update
  
	    @gossip = Gossip.find(params[:id])
	    gossip_params = params.require(:gossip).permit(:content, :title)
	    @gossip.update(gossip_params)
	    redirect_to gossips_path

  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to gossips_path
  end

  private

  def authenticate_user_new
    unless session[:user_id] 
      flash[:danger] = "Vous devez être connecter pour créer un gossip !"
      redirect_to "/session/new"
    end
  end

  def authenticate_user_show
    unless session[:user_id] 
      flash[:danger] = "Vous devez être connecter pour afficher le contenu d'un gossip !"
      redirect_to "/session/new"
    end
  end

  def authenticate_author
    i = 0
    Gossip.where(user_id: session[:user_id]).each do |gsp|
      if gsp.id.to_i == params[:id].to_i
        i = 1
      end
    end
    unless i == 1
      flash[:danger] = "Vous ne pouvez pas faire ça ce n'est pas votre gossip !"
      redirect_to "/"
    end
  end 
end
