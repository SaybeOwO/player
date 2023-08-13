class SongController < ApplicationController
    def addsong
        @song = Song.new
    end

    def create
        #render plain: params[:user]
        @song = Song.new(song_params)
        if @song.save
            session[:song_id] = @song.id
            redirect_to root_path, notice: "Registred successfully"
        else
            render :new
        end
    end

    private
    
    def song_params
        params.require(:song).permit(:link, :uid)
    end
end