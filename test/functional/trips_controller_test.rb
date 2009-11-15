require 'test_helper'

class TripsControllerTest < ActionController::TestCase
  
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trips)
  end

  test "should get new" do
    login_as(users(:administrator))
    get :new, :ministry => ministries(:mexico).id
    assert_response :success
  end
  
  test "shouldn't get new" do
    get :new, :ministry => ministries(:mexico).id
    assert_redirected_to login_url
  end

  test "should create trip" do
    login_as(users(:administrator))
    assert_difference('Trip.count') do
      post :create, :ministry => ministries(:mexico).id,
        :trip => {:name => 'test trip', :description => 'hello',
          :start_at => '2009-11-01', :stop_at => '2009-11-12' }
    end

    assert_redirected_to trip_path(assigns(:trip))
  end
  
  test "shouldn't create trip" do
    post :create, :trip => { }
    assert_redirected_to login_url
  end

  test "should show trip" do
    get :show, :id => trips(:conference2009).id
    assert_response :success
  end

  test "should get edit" do
    login_as(users(:administrator))
    get :edit, :id => trips(:conference2009).id
    assert_response :success
  end
  
  test "shouldn't get edit" do
    get :edit, :id => trips(:conference2009).id
    assert_redirected_to login_url
  end

  test "should update trip" do
    login_as(users(:administrator))
    put :update, :id => trips(:conference2009).id, :trip => { }
    assert_redirected_to trip_path(assigns(:trip))
  end
  
  test "shouldn't update trip" do
    put :update, :id => trips(:conference2009).id, :trip => { }
    assert_redirected_to login_url
  end

  test "should destroy trip" do
    login_as(users(:administrator))
    assert_difference('Trip.count', -1) do
      delete :destroy, :id => trips(:conference2009).id
    end

    assert_redirected_to ministry_path(assigns(:ministry))
  end
  
  test "shouldn't destroy trip" do
    delete :destroy, :id => trips(:conference2009).id
    assert_redirected_to login_url
  end
end
