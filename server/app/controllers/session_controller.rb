class SessionController < ApplicationController
    def signin
    end
    
    def create
        user = User.find_by(email: params[:email])
        if user.present? && user.authenticate(params[:password])#auth metodo controlla se psw è valida (già presente con secure psw quando dichiarato utente)
            session[:user_id] = user.id
            redirect_to root_path, notice: "logged in successfully"
        else
            flash[:alert] = "User not found"
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to root_path, notice: "Logged out"   
    end

end