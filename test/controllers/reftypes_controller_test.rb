require 'test_helper'

class ReftypesControllerTest < ActionController::TestCase
  setup do
    @reftype = reftypes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reftypes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reftype" do
    assert_difference('Reftype.count') do
      post :create, reftype: { name: @reftype.name }
    end

    assert_redirected_to reftype_path(assigns(:reftype))
  end

  test "should show reftype" do
    get :show, id: @reftype
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reftype
    assert_response :success
  end

  test "should update reftype" do
    patch :update, id: @reftype, reftype: { name: @reftype.name }
    assert_redirected_to reftype_path(assigns(:reftype))
  end

  test "should destroy reftype" do
    assert_difference('Reftype.count', -1) do
      delete :destroy, id: @reftype
    end

    assert_redirected_to reftypes_path
  end
end
