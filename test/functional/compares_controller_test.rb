require 'test_helper'

class ComparesControllerTest < ActionController::TestCase
  setup do
    @compare = compares(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:compares)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create compare" do
    assert_difference('Compare.count') do
      post :create, compare: { phone1_id: @compare.phone1_id, phone2: @compare.phone2, phone3_id: @compare.phone3_id, user_id: @compare.user_id }
    end

    assert_redirected_to compare_path(assigns(:compare))
  end

  test "should show compare" do
    get :show, id: @compare
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @compare
    assert_response :success
  end

  test "should update compare" do
    put :update, id: @compare, compare: { phone1_id: @compare.phone1_id, phone2: @compare.phone2, phone3_id: @compare.phone3_id, user_id: @compare.user_id }
    assert_redirected_to compare_path(assigns(:compare))
  end

  test "should destroy compare" do
    assert_difference('Compare.count', -1) do
      delete :destroy, id: @compare
    end

    assert_redirected_to compares_path
  end
end
