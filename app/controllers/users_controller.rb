
class UsersController < ApplicationController

	def show
		@id = params[:id]
	end
	
	def new

	end

	def create
		
	if params[:input_password] == params[:input_password2] && params[:input_password].length > 6 
    	@user = User.create(age: params[:birthday].to_i,first_name: params[:first_name], last_name: params[:last_name], desc: params[:desc], email: params[:input_email], password: params[:input_password], city_id: params[:city].to_i)
    	redirect_to "/" and return
    else
      if params[:input_password] != params[:input_password2] 
        flash[:danger] = "Les mots de passes ne correspondent pas!"
      else
        flash[:danger] = "Mot de passe trop court, veuillez le modifier et réessayer (minimum 6 charactères) !"
      end
    	redirect_to "../users/new"
    end
	end
end
