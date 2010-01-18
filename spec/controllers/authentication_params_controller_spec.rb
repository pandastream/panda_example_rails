require 'spec_helper'

describe AuthenticationParamsController do

  #Delete this example and add some real ones
  it "should report authentication params" do 
    Panda.should_receive(:append_authentication_params!).with("post", "/videos.json", {}).
      and_return({
        :access_key => "my_access_key",
        :timestamp => "12345",
        :signature => "my_signature"
      })
    
    get :index, :method=> "post", :request_uri => "/videos.json", :request_params => {}
    
    puts response.body.inspect
    auth_params = JSON.parse(response.body)
    auth_params['access_key'].should == "my_access_key"
    auth_params['timestamp'].should == "12345"
    auth_params['signature'].should == "my_signature"
  end

end
