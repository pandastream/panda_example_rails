class Video < ActiveRecord::Base
  def embed_html
    %(<embed src="http://videos.pandastream.com/flvplayer.swf" width="#{self.width}" height="#{self.height}" allowfullscreen="true" allowscriptaccess="always" flashvars="&displayheight=#{self.height}&file=#{self.url}&image=#{self.screenshot_url}&width=#{self.width}&height=#{self.height}" />)
  end
  
  def url
    "http://#{VIDEOS_DOMAIN}/#{self.filename}"
  end
  
  def screenshot_url
    "http://#{VIDEOS_DOMAIN}/#{self.screenshot}"
  end
  
  def thumbnail_url
    "http://#{VIDEOS_DOMAIN}/#{self.thumbnail}"
  end
  
  def encoded?
    !self.filename.blank?
  end
  
  def update_panda_status(panda_video)
    if encoding = panda_video.find_encoding("Flash video SD")
      self.filename = encoding.filename
      self.original_filename = encoding.original_filename
      self.screenshot = encoding.screenshot
      self.thumbnail = encoding.thumbnail
      self.duration = encoding.duration
      self.width = encoding.width
      self.height = encoding.height
      self.save
    end
  end
end