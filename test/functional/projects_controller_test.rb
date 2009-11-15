require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:projects)
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

  test "should create project" do
    login_as(users(:administrator))
    assert_difference('Project.count') do
      post :create, :ministry => ministries(:mexico).id,
        :project => {:name => 'test project', :description => 'hello',
          :code => 'TP' }
    end

    assert_redirected_to project_path(assigns(:project))
  end
  
  test "shouldn't create project" do
    post :create, :ministry => ministries(:mexico).id, :project => { }
    assert_redirected_to login_url
  end

  test "should show project" do
    get :show, :id => projects(:one).id
    assert_response :success
  end

  test "should get edit" do
    login_as(users(:administrator))
    get :edit, :id => projects(:one).id
    assert_response :success
  end
  
  test "shouldn't get edit" do
    get :edit, :id => projects(:one).id
    assert_redirected_to login_url
  end

  test "should update project" do
    login_as(users(:administrator))
    put :update, :id => projects(:one).id, :project => { }
    assert_redirected_to project_path(assigns(:project))
  end
  
  test "shouldn't update project" do
    put :update, :id => projects(:one).id, :project => { }
    assert_redirected_to login_url
  end

  test "should destroy project" do
    login_as(users(:administrator))
    assert_difference('Project.count', -1) do
      delete :destroy, :id => projects(:one).id
    end

    assert_redirected_to ministry_path(assigns(:ministry))
  end
  
  test "shouldn't destroy project" do
    delete :destroy, :id => projects(:one).id
    assert_redirected_to login_url
  end
end
