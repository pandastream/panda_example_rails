class PandaController < ApplicationController
  def authorize_upload
    payload = JSON.parse(params['payload'])
    new_upload = Panda.post('/videos/upload.json', {
      file_name: payload['filename'],
      file_size: payload['filesize'],
      profiles: "h264",
    })

    render :json => {:upload_url => new_upload['location']}
  end

  def authorize_upload_postprocess
    payload = JSON.parse(params['payload'])
    new_upload = Panda.post('/videos/upload.json', {
      file_name: payload['filename'],
      file_size: payload['filesize'],
      profiles: "h264",
    })

    render :json => {:upload_url => new_upload['location'], :postprocess_url => "/videos/postprocess"}
  end
end