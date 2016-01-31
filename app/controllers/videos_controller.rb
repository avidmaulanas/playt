class VideosController < ApplicationController
  before_action :set_video, only: [:destroy]
  before_action :set_videos, only: [:index, :create]
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

  # POST /videos
  # POST /videos.json
  def create
    @video = Video.new(video_params)

    respond_to do |format|
      if @video.save
        format.html { redirect_to videos_url, notice: 'Video was added.' }
      else
        format.html { render :index }
      end
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    @video.destroy
    redirect_to videos_url, notice: "<strong>#{@video.title}</strong>".html_safe + ' was removed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id])
    end

    def set_videos
      @videos = Video.all.page(params[:page]).per(6)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def video_params
      params.require(:video).permit(:link)
    end

    def set_loader_path
      gon.ajax_loader_path = ActionController::Base.helpers.image_path("loading.gif")
    end
end
