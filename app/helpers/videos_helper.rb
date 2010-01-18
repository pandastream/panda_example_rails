module VideosHelper
  def screenshot_url(encoding)
    "#{VIDEOS_PATH_PREFIX}/#{encoding['id']}_4.jpg"
  end
  
  def encoding_url(encoding)
    "#{VIDEOS_PATH_PREFIX}/#{encoding['id']}#{encoding['extname']}"
  end
  
  def iphone_stream_encoding_url(encoding)
    "#{VIDEOS_PATH_PREFIX}/#{encoding['id']}.m3u8"
  end
  
  def embed_encoding(encoding)
    %(<embed src="#{VIDEOS_PATH_PREFIX}/player.swf" width="#{encoding['width']}" height="#{encoding['height']}" flashvars="file=#{encoding_url(encoding)}&image=#{screenshot_url(encoding)}" />)
  end
end
