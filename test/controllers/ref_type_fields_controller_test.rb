require 'test_helper'

class RefTypeFieldsControllerTest < ActionController::TestCase
  setup do
    @ref_type_field = ref_type_fields(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ref_type_fields)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ref_type_field" do
    assert_difference('RefTypeField.count') do
      post :create, ref_type_field: { obligatory: @ref_type_field.obligatory, ref_attribute_id: @ref_type_field.ref_attribute_id, reftype_id: @ref_type_field.reftype_id }
    end

    assert_redirected_to ref_type_field_path(assigns(:ref_type_field))
  end

  test "should show ref_type_field" do
    get :show, id: @ref_type_field
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ref_type_field
    assert_response :success
  end

  test "should update ref_type_field" do
    patch :update, id: @ref_type_field, ref_type_field: { obligatory: @ref_type_field.obligatory, ref_attribute_id: @ref_type_field.ref_attribute_id, reftype_id: @ref_type_field.reftype_id }
    assert_redirected_to ref_type_field_path(assigns(:ref_type_field))
  end

  test "should destroy ref_type_field" do
    assert_difference('RefTypeField.count', -1) do
      delete :destroy, id: @ref_type_field
    end

    assert_redirected_to ref_type_fields_path
  end
end
