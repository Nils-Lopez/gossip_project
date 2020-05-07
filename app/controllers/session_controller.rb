class SessionController < ApplicationController
	include SessionHelper
	def new

	end

	def create
		user = User.find_by(email: params[:email])

		if user && user.authenticate(params[:pwd])
			session[:user_id] = user.id
			redirect_to "/"
		else
			flash[:danger] = "Adresse email ou mot de passe incorrect!"
			render 'new'
			
		end
	end

	def destroy
		session.delete(:user_id)
		redirect_to :controller=>'gossips',:action=>'index' and return
	end
end
