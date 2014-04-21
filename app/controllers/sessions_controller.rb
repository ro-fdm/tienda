class SessionsController < ApplicationController
  before_action :set_session, only: [:show, :edit, :destroy]


  # GET /sessions/new
  def new
  end


  # POST /sessions
  # POST /sessions.json
  def create
		@user = User.where("name = ? or email = ?", params[:username], params[:username]  ).first
		#seria el equivalente a @user= User.where("name = ? or email = ?", eou.name, eou.email)??
	
			if @user && @user.authenticate(params[:password])

				session[:user_id] = @user.id
       	cookies[:user_id] = @user.id
       	flash[:alert] = "Sesion iniciada"
=begin
cookies if return to del check user en orders_controller
       	if cookies[:return_to]
       		redirect_to cookies[:return_to]
       	else
					redirect_to root_path #, :notice => "Logueado"
				end
=end				
				redirect_to root_path
			else
				 flash.now.alert = "Nombre, email o password incorrectos"
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
