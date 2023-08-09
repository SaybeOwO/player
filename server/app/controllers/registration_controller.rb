class RegistrationController < ApplicationController
    def signup
        @user = User.new
    end

    def create
        #render plain: params[:user]
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to root_path, notice: "Registred successfully"
        else
            render :new
        end
    end

    private
    
    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end
end