class VideosController < ApplicationController
  # List videos and their current state
  def index
    @videos = Video.find(:all)
  end
  
  def show
    @video = Video.find(params[:id])
    @panda_video = Panda::Video.find(@video.panda_id)
    @video.update_panda_status(@panda_video) if RAILS_ENV == "development"
  end
  
  def new
    @video = Video.new
  end
  
  def create
    @panda_video = Panda::Video.create
    @video = Video.create(params[:video].merge({:panda_id => @panda_video.id}))
    redirect_to :action => "upload", :id => @video.id
  end
  
  def upload
    @video = Video.find(params[:id])
    @upload_form_url = %(http://upload.pandastream.com/videos/#{@video.panda_id}/form)
  end
  
  def status
    @video = Video.find_by_panda_id(params[:id])
    @panda_video = Panda::Video.new(params[:video])
    @video.update_panda_status(@panda_video)
    render :text => ''
  end
end
