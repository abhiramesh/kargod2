require 'test_helper'

class TrimsControllerTest < ActionController::TestCase
  setup do
    @trim = trims(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trims)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create trim" do
    assert_difference('Trim.count') do
      post :create, trim: {  }
    end

    assert_redirected_to trim_path(assigns(:trim))
  end

  test "should show trim" do
    get :show, id: @trim
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @trim
    assert_response :success
  end

  test "should update trim" do
    put :update, id: @trim, trim: {  }
    assert_redirected_to trim_path(assigns(:trim))
  end

  test "should destroy trim" do
    assert_difference('Trim.count', -1) do
      delete :destroy, id: @trim
    end

    assert_redirected_to trims_path
  end
end
