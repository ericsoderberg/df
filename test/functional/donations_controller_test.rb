require 'test_helper'

class DonationsControllerTest < ActionController::TestCase
  test "should get index" do
    login_as(users(:administrator))
    get :index
    assert_response :success
    assert_not_nil assigns(:donations)
  end
  
  test "shouldn't get index" do
    get :index
    assert_redirected_to login_url
  end

  test "should get new" do
    login_as(users(:generic))
    get :new, :project => projects(:one).id
    assert_response :success
  end
  
  test "shouldn't get new" do
    get :new, :project => projects(:one).id
    assert_redirected_to login_url
  end

  test "should create donation" do
    login_as(users(:generic))
    assert_difference('Donation.count') do
      post :create, :project => projects(:one).id,
        :donation => {:amount => '100'}
    end

    assert_redirected_to donation_path(assigns(:donation))
  end
  
  test "shouldn't create donation" do
    post :create, :project => projects(:one).id, :donation => {}
    assert_redirected_to login_url
  end

  test "should show donation" do
    login_as(users(:generic))
    get :show, :id => donations(:one).id
    assert_response :success
  end
  
  test "shouldn't show donation" do
    get :show, :id => donations(:one).id
    assert_redirected_to login_url
  end

  test "should get edit" do
    login_as(users(:generic))
    get :edit, :id => donations(:one).id
    assert_response :success
  end
  
  test "shouldn't get edit" do
    get :edit, :id => donations(:one).id
    assert_redirected_to login_url
  end

  test "should update donation" do
    login_as(users(:generic))
    put :update, :id => donations(:one).id, :donation => { }
    assert_redirected_to project_path(assigns(:donation).project)
  end
  
  test "shouldn't update donation" do
    put :update, :id => donations(:one).id, :donation => { }
    assert_redirected_to login_url
  end

  test "should destroy donation" do
    login_as(users(:generic))
    assert_difference('Donation.count', -1) do
      delete :destroy, :id => donations(:one).id
    end

    assert_redirected_to project_path(assigns(:project))
  end
  
  test "shouldn't destroy donation" do
    delete :destroy, :id => donations(:one).id
    assert_redirected_to login_url
  end
end
