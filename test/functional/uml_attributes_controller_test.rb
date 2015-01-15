require 'test_helper'

class UmlAttributesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:uml_attributes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create uml_attribute" do
    assert_difference('UmlAttribute.count') do
      post :create, :uml_attribute => { }
    end

    assert_redirected_to uml_attribute_path(assigns(:uml_attribute))
  end

  test "should show uml_attribute" do
    get :show, :id => uml_attributes(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => uml_attributes(:one).to_param
    assert_response :success
  end

  test "should update uml_attribute" do
    put :update, :id => uml_attributes(:one).to_param, :uml_attribute => { }
    assert_redirected_to uml_attribute_path(assigns(:uml_attribute))
  end

  test "should destroy uml_attribute" do
    assert_difference('UmlAttribute.count', -1) do
      delete :destroy, :id => uml_attributes(:one).to_param
    end

    assert_redirected_to uml_attributes_path
  end
end
