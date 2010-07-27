#No reference to Panda at all here - it's all handled in the Video model.
class VideosController < ApplicationController
  def show
    @video = Video.find(params[:id])
    @encoding = @video.panda_encodings.profile_name("h264") #doesn't work yet?
  end
  
  def new
    @video = Video.new
  end
  
  def create
    @video = Video.create!(params[:video])
    redirect_to :action => :show, :id => @video.id
  end
end
