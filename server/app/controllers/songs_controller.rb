class SongsController < ApplicationController
  before_action :set_song, only: %i[ show edit update destroy ]


  def loadsession
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
  end

  # GET /songs or /songs.json
  def index 
    loadsession
    @songs = Song.where(uid: @user.id)#sistema _______________________________________
    #render @user
  end

  # GET /songs/1 or /songs/1.json
  def show
  end

  # GET /songs/new
  def new
    @song = Song.new
    loadsession
  end

  # GET /songs/1/edit
  def edit
    loadsession
  end

  # POST /songs or /songs.json
  def create
    loadsession
    @song = Song.new(song_params)

    respond_to do |format|
      if @song.save
        format.html { redirect_to song_url(@song), notice: "song was successfully created." }
        format.json { render :show, status: :created, location: @song }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /songs/1 or /songs/1.json
  def update
    loadsession
    respond_to do |format|
      if @song.update(song_params)
        format.html { redirect_to song_url(@song), notice: "song was successfully updated." }
        format.json { render :show, status: :ok, location: @song }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /songs/1 or /songs/1.json
  def destroy
    @song.destroy

    respond_to do |format|
      format.html { redirect_to songs_url, notice: "song was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_song
      @song = Song.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def song_params
      params.require(:song).permit(:link, :uid)
    end
end
