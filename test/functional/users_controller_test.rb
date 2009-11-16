require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  
  test "should get index" do
    login_as(users(:administrator))
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end
  
  test "shouldn't get index" do
    get :index
    assert_redirected_to login_url
  end

  test "should get new" do
    get :new
    assert_response :success
  end
  
  # can't test due to email_regex
=begin
  test "should create user" do
    assert_difference('User.count') do
      post :create,
        :user => {:name => 'test user', :email => 'test.user@localhost',
          :password => 'testpassword',
          :password_confirmation => 'testpassword' }
    end

    assert_redirected_to root_path
  end
=end
  
  test "should show user" do
    login_as(users(:administrator))
    get :show, :id => users(:generic).id
    assert_response :success
  end
  
  test "shouldn't show user" do
    get :show, :id => users(:generic).id
    assert_redirected_to login_url
  end

  test "should get edit" do
    login_as(users(:generic))
    get :edit, :id => users(:generic).id
    assert_response :success
  end
  
  test "shouldn't get edit" do
    get :edit, :id => users(:generic).id
    assert_redirected_to login_url
  end

  # can't test due to email_regex
=begin
  test "should update user" do
    login_as(users(:generic))
    put :update, :id => users(:generic).id, :user => { }
    assert_redirected_to user_path(assigns(:user))
  end
=end
  
  test "shouldn't update user" do
    put :update, :id => users(:generic).id, :user => { }
    assert_redirected_to login_url
  end

  test "should destroy user" do
    login_as(users(:administrator))
    delete :destroy, :id => users(:generic).id
    assert(assigns(:user).state == 'deleted')
    assert_redirected_to users_path
  end
  
  test "shouldn't destroy user" do
    delete :destroy, :id => users(:generic).id
    assert_redirected_to login_url
  end
end
