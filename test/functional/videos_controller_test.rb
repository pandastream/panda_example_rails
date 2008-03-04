require File.dirname(__FILE__) + '/../test_helper'
require 'videos_controller'

# Re-raise errors caught by the controller.
class VideosController; def rescue_action(e) raise e end; end

class VideosControllerTest < Test::Unit::TestCase
  def setup
    @controller = VideosController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
