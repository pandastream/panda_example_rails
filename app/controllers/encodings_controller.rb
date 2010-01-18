class EncodingsController < ApplicationController
  def index
    render :json => Panda.get("/videos/#{params[:video_id]}/encodings.json")
  end
end
