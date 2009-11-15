require 'test_helper'

class DataFilesControllerTest < ActionController::TestCase
  test "should get index" do
    login_as(users(:administrator))
    get :index
    assert_response :success
    assert_not_nil assigns(:data_files)
  end
  
  test "shouldn't get index" do
    get :index
    assert_redirected_to login_url
  end

  test "should create data_file" do
    login_as(users(:administrator))
    assert_difference('DataFile.count') do
      post :create, :upload => {:datafile =>
          fixture_file_upload('files/message_file-x.pdf')}
    end

    assert_redirected_to data_files_path
  end
  
  test "shouldn't create data_file" do
    post :create, :upload => { }
    assert_redirected_to login_url
  end

  test "should destroy data_file" do
    login_as(users(:administrator))
    assert_difference('DataFile.count', -1) do
      delete :destroy, :id => data_files(:one).to_param
    end

    assert_redirected_to data_files_path
  end
  
  test "shouldn't destroy data_file" do
    delete :destroy, :id => data_files(:one).to_param
    assert_redirected_to login_url
  end
end
