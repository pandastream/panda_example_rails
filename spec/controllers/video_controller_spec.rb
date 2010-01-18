require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

VIDEO_JSON = %({
  "id":"d2a5e752-b823-11de-b3a7-001ec2b5c0e1",
  "original_filename":"test.mp4",
  "extname":".mp4",
  "video_codec":"h264",
  "audio_codec":"aac",
  "thumbnail_position":50,
  "height":240,
  "width":300,
  "fps":29,
  "duration":14000,
  "state_update_url":"http://mypandasite.com/videos/update?id=$id",
  "upload_redirect_url":"http://mypandasite.com/videos/done?id=$id&error=$error&error_message=$error_message",
  "created_at":"2009/10/13 19:11:26 +0100",
  "updated_at":"2009/10/13 19:11:26 +0100",
  "status":"my_custom_status"
})

describe VideosController do
  describe "POST to /videos" do
    it "should post to panda when creating" do
      Panda.should_receive(:post).with("/videos.json",{:source_url => "http://www.lcpvideo.com/MPEG/SCHONBEK.MPG"}).and_return(VIDEO_JSON)
      post :create, {:source_url => "http://www.lcpvideo.com/MPEG/SCHONBEK.MPG"}
    end
    
    it "should redirect to the video show page" do
      Panda.stub!(:post).and_return(VIDEO_JSON)
      post :create, {:source_url => "http://www.lcpvideo.com/MPEG/SCHONBEK.MPG"}
      response.should redirect_to(:action => 'processing', :id => "d2a5e752-b823-11de-b3a7-001ec2b5c0e1")
    end
  end  
end