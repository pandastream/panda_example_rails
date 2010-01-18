require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe VideosController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "videos", :action => "index").should == "/videos"
    end

    it "maps #new" do
      route_for(:controller => "videos", :action => "new").should == "/videos/new"
    end

    it "maps #show" do
      route_for(:controller => "videos", :action => "show", :id => "1").should == "/videos/1"
    end

    it "maps #edit" do
      route_for(:controller => "videos", :action => "edit", :id => "1").should == "/videos/1/edit"
    end

    it "maps #create" do
      route_for(:controller => "videos", :action => "create").should == {:path => "/videos", :method => :post}
    end

    it "maps #update" do
      route_for(:controller => "videos", :action => "update", :id => "1").should == {:path =>"/videos/1", :method => :put}
    end

    it "maps #destroy" do
      route_for(:controller => "videos", :action => "destroy", :id => "1").should == {:path =>"/videos/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/videos").should == {:controller => "videos", :action => "index"}
    end

    it "generates params for #new" do
      params_from(:get, "/videos/new").should == {:controller => "videos", :action => "new"}
    end

    it "generates params for #create" do
      params_from(:post, "/videos").should == {:controller => "videos", :action => "create"}
    end

    it "generates params for #show" do
      params_from(:get, "/videos/1").should == {:controller => "videos", :action => "show", :id => "1"}
    end

    it "generates params for #edit" do
      params_from(:get, "/videos/1/edit").should == {:controller => "videos", :action => "edit", :id => "1"}
    end

    it "generates params for #update" do
      params_from(:put, "/videos/1").should == {:controller => "videos", :action => "update", :id => "1"}
    end

    it "generates params for #destroy" do
      params_from(:delete, "/videos/1").should == {:controller => "videos", :action => "destroy", :id => "1"}
    end
  end
end
