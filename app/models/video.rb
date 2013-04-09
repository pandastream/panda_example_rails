class Video < ActiveRecord::Base
  #Panda also provides a Panda::Video, but we wrap it in our own ActiveRecord
  #class in order to get local storage, and so that we can add our own
  #associations and metadata.
  
  attr_accessible :panda_video_id, :title
  validates_presence_of :panda_video_id

  #Provide access to the wrapped object
  def panda_video
    @original_video ||= Panda::Video.find(panda_video_id)
  end
end
