class Video < ActiveRecord::Base
  def embed_html
    %(<embed src="http://videos.pandastream.com/flvplayer.swf" width="#{self.width}" height="#{self.height}" allowfullscreen="true" allowscriptaccess="always" flashvars="&displayheight=#{self.height}&file=#{self.video_url}&width=#{self.width}&height=#{self.height}" />)
  end
  
  def update_panda_status(panda_video)
    # If the video has been encoded, save the url of the standard quality flash video which users will watch
    if panda_video.status == 'done'
      if encoding = panda_video.encodings.find { |e| 
          e[:format] == 'flv' and \
          e[:quality] == 'sd' and \
          e[:status] == 'success'
        }
        self.video_url = encoding[:filename]
        self.width = encoding[:width]
        self.height = encoding[:height]
        save
      end
    end
  end
end