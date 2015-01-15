require 'test_helper'

class UmlClassesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:uml_classes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create uml_class" do
    assert_difference('UmlClass.count') do
      post :create, :uml_class => { }
    end

    assert_redirected_to uml_class_path(assigns(:uml_class))
  end

  test "should show uml_class" do
    get :show, :id => uml_classes(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => uml_classes(:one).to_param
    assert_response :success
  end

  test "should update uml_class" do
    put :update, :id => uml_classes(:one).to_param, :uml_class => { }
    assert_redirected_to uml_class_path(assigns(:uml_class))
  end

  test "should destroy uml_class" do
    assert_difference('UmlClass.count', -1) do
      delete :destroy, :id => uml_classes(:one).to_param
    end

    assert_redirected_to uml_classes_path
  end
end
