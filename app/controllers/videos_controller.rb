require 'ostruct'
require 'pp'

class VideosController < ApplicationController
  def show
    s3_bucket_url = "http://#{S3_CONFIG['bucket']}.s3.amazonaws.com"

    @video = Video.find(params[:id])
    encodings = JSON.parse(PANDA.get("/videos/#{@video.panda_video_id}/encodings.json"))
    encoding_data = encodings.find{|e| e['status'] == 'success' && e['extname'] == '.mp4' }
    if encoding_data
      @encoding = OpenStruct.new(encoding_data)
      @encoding.panda_encoding_id = encoding_data['id']
      @encoding.url = s3_bucket_url + '/' + @encoding.panda_encoding_id + @encoding.extname
      @encoding.screenshot_url = s3_bucket_url + '/' + @encoding.panda_encoding_id + "_4.jpg"
    end
    
    @pretty_printed_encodings = ''
    PP.pp(encodings, @pretty_printed_encodings)
  end
  
  def new
    @video = Video.new
  end
  
  def create
    @video = Video.create!(params[:video])
    redirect_to :action => :show, :id => @video.id
  end
end
