require 'test_helper'

class EventsControllerTest < ActionController::TestCase

  def setup
    @event = events(:orange)
  end
  
  test "should redirect create when not logged in" do
    assert_no_difference 'Event.count' do
      post :create, event: { content: "Lorem ipsum" }
    end
    assert_redirected_to login_url
  end
  
  test "should redirect destroy when not logged in" do
    assert_no_difference 'Event.count' do
      delete :destroy, id: @event
    end
    assert_redirected_to login_url
  end
  
  test "should redirect destroy for wrong event" do
    log_in_as(users(:michael))
    assert_no_difference 'Event.count' do
      delete :destroy, id: events(:ants)
    end
  end
end
