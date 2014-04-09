class SessionsController < ApplicationController
  before_action :set_session, only: [:show, :edit, :destroy]


  # GET /sessions/new
  def new
  end


  # POST /sessions
  # POST /sessions.json
  def create
    @session = Session.new(session_params)

		user = User.where("name = ? or email = ?", params[:user][:name],  params[:user][:email]).first
		#seria el equivalente a @user= User.where("name = ? or email = ?", eou.name, eou.email)??
	
			if user && user.authenticate(params[:user][:password])
				@session = Session.new
				user = @current_user
				redirect_to root_path, :notice => "Logueado"
			else
				format.html { render new, :notice  =>'Datos incorrectos' }
			end

  end

 
  # DELETE /sessions/1
  # DELETE /sessions/1.json
  def destroy
    @session.destroy
    respond_to do |format|
      format.html { redirect_to sessions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_session
      @session = Session.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def session_params
      params.permit(session: :user_id, user_attributes: [:name, :email, :password])
          puts "8"*80
      puts session_params.inspect
    end
end
