require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get index" do
    login_as(users(:administrator))
    get :index
    assert_response :success
    assert_not_nil assigns(:pages)
  end
  
  test "shouldn't get index" do
    get :index
    assert_redirected_to login_url
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

  test "should create page" do
    login_as(users(:administrator))
    assert_difference('Page.count') do
      post :create, :page => {:name => 'test page', :contents => 'hello' }
    end

    assert_redirected_to page_path(assigns(:page))
  end
  
  test "shouldn't create page" do
    post :create, :page => { }
    assert_redirected_to login_url
  end

  test "should show page" do
    get :show, :id => pages(:one).id
    assert_response :success
  end

  test "should get edit" do
    login_as(users(:administrator))
    get :edit, :id => pages(:one).id
    assert_response :success
  end
  
  test "shouldn't get edit" do
    get :edit, :id => pages(:one).id
    assert_redirected_to login_url
  end

  test "should update page" do
    login_as(users(:administrator))
    put :update, :id => pages(:one).id, :page => { }
    assert_redirected_to page_path(assigns(:page))
  end
  
  test "shouldn't update page" do
    put :update, :id => pages(:one).id, :page => { }
    assert_redirected_to login_url
  end

  test "should destroy page" do
    login_as(users(:administrator))
    assert_difference('Page.count', -1) do
      delete :destroy, :id => pages(:one).id
    end

    assert_redirected_to pages_path
  end
  
  test "shouldn't destroy page" do
    delete :destroy, :id => pages(:one).id
    assert_redirected_to login_url
  end
end
