require 'test_helper'

class MinistriesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ministries)
  end

  test "should get new" do
    login_as(users(:administrator))
    get :new
    assert_response :success
  end
  
  test "shouldn't get new" do
    get :new
    assert_redirected_to login_url
  end

  test "should create ministry" do
    login_as(users(:administrator))
    assert_difference('Ministry.count') do
      post :create, :ministry => {:name => 'test ministry',
        :description => 'hello', :code => 'TM' }
    end

    assert_redirected_to ministry_path(assigns(:ministry))
  end
  
  test "shouldn't create ministry" do
    post :create, :ministry => { }
    assert_redirected_to login_url
  end

  test "should show ministry" do
    get :show, :id => ministries(:mexico).id
    assert_response :success
  end

  test "should get edit" do
    login_as(users(:administrator))
    get :edit, :id => ministries(:mexico).id
    assert_response :success
  end
  
  test "shouldn't get edit" do
    get :edit, :id => ministries(:mexico).id
    assert_redirected_to login_url
  end

  test "should update ministry" do
    login_as(users(:administrator))
    put :update, :id => ministries(:mexico).id, :ministry => { }
    assert_redirected_to ministry_path(assigns(:ministry))
  end
  
  test "shouldn't update ministry" do
    put :update, :id => ministries(:mexico).id, :ministry => { }
    assert_redirected_to login_url
  end

  test "should destroy ministry" do
    login_as(users(:administrator))
    assert_difference('Ministry.count', -1) do
      delete :destroy, :id => ministries(:mexico).id
    end

    assert_redirected_to ministries_path
  end
  
  test "shouldn't destroy ministry" do
    delete :destroy, :id => ministries(:mexico).id
    assert_redirected_to login_url
  end
end
