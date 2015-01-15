require 'test_helper'

class StereotypesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stereotypes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stereotype" do
    assert_difference('Stereotype.count') do
      post :create, :stereotype => { }
    end

    assert_redirected_to stereotype_path(assigns(:stereotype))
  end

  test "should show stereotype" do
    get :show, :id => stereotypes(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => stereotypes(:one).to_param
    assert_response :success
  end

  test "should update stereotype" do
    put :update, :id => stereotypes(:one).to_param, :stereotype => { }
    assert_redirected_to stereotype_path(assigns(:stereotype))
  end

  test "should destroy stereotype" do
    assert_difference('Stereotype.count', -1) do
      delete :destroy, :id => stereotypes(:one).to_param
    end

    assert_redirected_to stereotypes_path
  end
end
