require 'test_helper'

class AssociationClassesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:association_classes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create association_class" do
    assert_difference('AssociationClass.count') do
      post :create, :association_class => { }
    end

    assert_redirected_to association_class_path(assigns(:association_class))
  end

  test "should show association_class" do
    get :show, :id => association_classes(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => association_classes(:one).to_param
    assert_response :success
  end

  test "should update association_class" do
    put :update, :id => association_classes(:one).to_param, :association_class => { }
    assert_redirected_to association_class_path(assigns(:association_class))
  end

  test "should destroy association_class" do
    assert_difference('AssociationClass.count', -1) do
      delete :destroy, :id => association_classes(:one).to_param
    end

    assert_redirected_to association_classes_path
  end
end
