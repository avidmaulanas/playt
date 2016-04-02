class VideosController < ApplicationController
  before_action :set_video, only: [:show, :destroy]
  before_action :set_videos, only: [:index, :show, :create]
  before_action :set_playback_videos, only: [:playback]
  before_action :set_loader_path, only: [:index]
  before_action :authenticate_user!, only: [:destroy]

  rescue_from Yt::Errors::ServerError do |exception|
    redirect_to videos_url, alert: "Unable to connect to YouTube"
  end

  # GET /videos
  # GET /videos.json
  def index
    @video = Video.new
  end

  def show    
  end
  # POST /videos
  # POST /videos.json
  def create
    @video = Video.new(video_params)

    if cookies[:request_count].to_i < 3 or user_signed_in?
      respond_to do |format|
        if @video.save
          cookies[:request_count] = { value: cookies[:request_count].to_i + 1, expires: 6.hour.from_now }
          format.html { redirect_to videos_url, notice: 'Video was added.' }
        else
          format.html { render :index }
        end
      end
    else
      redirect_to videos_url, alert: 'Ups! Sorry.. Your allowed request only 3 times.'
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    status = true #@video.destroy
    render json: { success: status }
    # redirect_to videos_url, notice: "<strong>#{@video.title}</strong>".html_safe + ' was removed.'
  end

  def playback
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find_by!(yt_id: params[:id])
    end

    def set_videos
      @videos = Video.all.page(params[:page]).per(9)
      @videos_size = Video.all.size
    end

    def set_playback_videos
      @videos = Video.all
      @videos_size = @videos.size
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def video_params
      params.require(:video).permit(:link)
    end

    def set_loader_path
      gon.ajax_loader_path = ActionController::Base.helpers.image_path("loading.gif")
    end
end
