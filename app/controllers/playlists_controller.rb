class PlaylistsController < ApplicationController
  before_action :set_playlist, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :update, :destroy]

  # GET /playlists
  # GET /playlists.json
  def index
    @playlists = if user_signed_in? 
      Playlist.current_user
    else
      Playlist.privacy_public
    end
  end

  # GET /playlists/1
  # GET /playlists/1.json
  def show
    @video = @playlist.videos.new
  end

  # GET /playlists/new
  def new
    @playlist = Playlist.new
  end

  # GET /playlists/1/edit
  def edit
  end

  # POST /playlists
  # POST /playlists.json
  def create
    @playlist = Playlist.new(playlist_params)
    @playlist.user_id = current_user.id

    respond_to do |format|
      if @playlist.save
        format.html { redirect_to @playlist, notice: "Playlist #{@playlist.name} was successfully created." }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /playlists/1
  # PATCH/PUT /playlists/1.json
  def update
    respond_to do |format|
      if @playlist.update(playlist_params)
        format.html { redirect_to request.referer, notice: 'Playlist was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /playlists/1
  # DELETE /playlists/1.json
  def destroy
    @playlist.destroy
    respond_to do |format|
      format.html { redirect_to playlists_url, notice: 'Playlist was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_playlist
      @playlist = Playlist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def playlist_params
      params.require(:playlist).permit(:name, :privacy)
    end
end
