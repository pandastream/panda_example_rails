class VideosController < ApplicationController
  ENCODINGS_TO_DISPLAY = ['Flash FLV (Medium)', 'iPhone stream (Medium)']
    
    
  def new
  end
  
  def show
    video_json = Panda.get("/videos/#{params[:id]}.json")
    encodings_json = Panda.get("/videos/#{params[:id]}/encodings.json")
    profiles_json = Panda.get("/profiles.json")
    
    respond_to do |r|
      r.html {
        @video = JSON.parse(video_json)
        @encodings = JSON.parse(encodings_json)
        @profiles = JSON.parse(profiles_json)
        @encodings = encodings_for_profiles(@profiles, @encodings, ENCODINGS_TO_DISPLAY)
      }
      r.json {
        render :json => "({video: #{video_json}, encodings: #{encodings_json} })"
      }
    end
  end
  
  def index
    @videos = JSON.parse(Panda.get("/videos.json"))
  end
  
  def create
    @video = JSON.parse(Panda.post("/videos.json", {:source_url => params[:source_url], :profiles => params[:profiles]}))
    redirect_to :action => :processing, :id => @video['id']
  end
  
  def processing
    
  end
  
  private
  
  def encodings_for_profiles(profiles, encodings, profile_tiles)
    encodings_for_profiles = []
    profile_tiles.each do |title|
      profile = profiles.find {|p| p['title'] == title }
      if profile
        encoding = encodings.find {|e| e['profile_id'] == profile['id'] }
        encodings_for_profiles << encoding if encoding
      end
    end
    encodings_for_profiles
  end
end
