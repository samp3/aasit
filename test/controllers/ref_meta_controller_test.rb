require 'test_helper'

class RefMetaControllerTest < ActionController::TestCase
  setup do
    @ref_metum = ref_meta(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ref_meta)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ref_metum" do
    assert_difference('RefMetum.count') do
      post :create, ref_metum: { refAttribute_id: @ref_metum.refAttribute_id, ref_id: @ref_metum.ref_id, value: @ref_metum.value }
    end

    assert_redirected_to ref_metum_path(assigns(:ref_metum))
  end

  test "should show ref_metum" do
    get :show, id: @ref_metum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ref_metum
    assert_response :success
  end

  test "should update ref_metum" do
    patch :update, id: @ref_metum, ref_metum: { refAttribute_id: @ref_metum.refAttribute_id, ref_id: @ref_metum.ref_id, value: @ref_metum.value }
    assert_redirected_to ref_metum_path(assigns(:ref_metum))
  end

  test "should destroy ref_metum" do
    assert_difference('RefMetum.count', -1) do
      delete :destroy, id: @ref_metum
    end

    assert_redirected_to ref_meta_path
  end
end
