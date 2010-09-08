class VideosController < ApplicationController
  def show
    @video = Video.find(params[:id])
    @panda_video = @video.panda_video
    @h264_encoding = find_h264_encoding(@panda_video)
  end
  
  def new
    @video = Video.new
  end
  
  def create
    @video = Video.create!(params[:video])
    redirect_to :action => :show, :id => @video.id
  end


  private
  
  def find_h264_encoding(video)
    name = %w{h264.hi h264 h264.lo}.find do |name|
      video.encodings.find_by_profile_name(name)
    end
    video.encodings.find_by_profile_name(name)
  end

end
