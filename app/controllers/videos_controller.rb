class VideosController < ApplicationController
  include Rails.application.routes.url_helpers

  def show
    @video = Video.find(params[:id])
    @original_video = @video.panda_video
    @h264_encoding = @original_video.encodings['h264']
  end

  def simple
    @video = Video.new
    render 'simple'
  end

  def advanced
    render 'advanced'
  end

  def create
    @video = Video.create!(params[:video])
    redirect_to :action => :show, :id => @video.id
  end

  def postprocess
    video_params = JSON.parse(params["upload_response"])
    @video = Video.new(:panda_video_id => video_params["id"], :title => "Title-to-be-edited-later")

    if @video.save
      render :json => {:play_url => url_for(@video), :id => @video_id}
    end
  end

end
