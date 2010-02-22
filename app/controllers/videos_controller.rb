class VideosController < ApplicationController
  def show
    s3_bucket_url = "http://s3.amazonaws.com/panda-test-videos/"

    @video = Video.find(params[:id])
    @video_data =  JSON.parse(PANDA.get("/videos/#{@video.panda_video_id}.json"))
    # Find the url of the video from the first profile
    @encoding_data = JSON.parse(PANDA.get("/videos/#{@video.panda_video_id}/encodings.json")).first
    
    @video_url = s3_bucket_url + @encoding_data['id'] + @encoding_data['extname']
    @screenshot_url = s3_bucket_url + @encoding_data['id'] + "_4.jpg"
  end
  
  def new
    @video = Video.new
  end
  
  def create
    @video = Video.create!(params[:video])
    redirect_to :action => :show, :id => @video.id
  end
end
