class SessionsController < ApplicationController
  before_action :set_session, only: [:show, :edit, :destroy]


  # GET /sessions/new
  def new
  end


  # POST /sessions
  # POST /sessions.json
  def create

		user = User.where("name = ? or email = ?", params[:username], params[:username]  ).first
		#seria el equivalente a @user= User.where("name = ? or email = ?", eou.name, eou.email)??
	
			if user && user.authenticate(params[:password])
				session[:user_id] = user.id
       	cookies[:user_id] = user.id
				redirect_to root_path, :notice => "Logueado"
			else
				 render "new"
			end

  end

 
  # DELETE /sessions/1
  # DELETE /sessions/1.json
  def destroy		
    cookies[:user_id] = nil
    redirect_to root_url , :notice => "Has salido de tu cuenta"
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def session_params
 			params.permit(:username, :password)
    end
end
