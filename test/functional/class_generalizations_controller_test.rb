require 'test_helper'

class ClassGeneralizationsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:class_generalizations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create class_generalization" do
    assert_difference('ClassGeneralization.count') do
      post :create, :class_generalization => { }
    end

    assert_redirected_to class_generalization_path(assigns(:class_generalization))
  end

  test "should show class_generalization" do
    get :show, :id => class_generalizations(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => class_generalizations(:one).to_param
    assert_response :success
  end

  test "should update class_generalization" do
    put :update, :id => class_generalizations(:one).to_param, :class_generalization => { }
    assert_redirected_to class_generalization_path(assigns(:class_generalization))
  end

  test "should destroy class_generalization" do
    assert_difference('ClassGeneralization.count', -1) do
      delete :destroy, :id => class_generalizations(:one).to_param
    end

    assert_redirected_to class_generalizations_path
  end
end
