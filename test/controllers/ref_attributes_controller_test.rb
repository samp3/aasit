require 'test_helper'

class RefAttributesControllerTest < ActionController::TestCase
  setup do
    @ref_attribute = ref_attributes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ref_attributes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ref_attribute" do
    assert_difference('RefAttribute.count') do
      post :create, ref_attribute: { name: @ref_attribute.name }
    end

    assert_redirected_to ref_attribute_path(assigns(:ref_attribute))
  end

  test "should show ref_attribute" do
    get :show, id: @ref_attribute
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ref_attribute
    assert_response :success
  end

  test "should update ref_attribute" do
    patch :update, id: @ref_attribute, ref_attribute: { name: @ref_attribute.name }
    assert_redirected_to ref_attribute_path(assigns(:ref_attribute))
  end

  test "should destroy ref_attribute" do
    assert_difference('RefAttribute.count', -1) do
      delete :destroy, id: @ref_attribute
    end

    assert_redirected_to ref_attributes_path
  end
end
