require 'test_helper'

class EfficacyMastersControllerTest < ActionController::TestCase
  setup do
    @efficacy_master = efficacy_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:efficacy_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create efficacy_master" do
    assert_difference('EfficacyMaster.count') do
      post :create, efficacy_master: { code: @efficacy_master.code, name: @efficacy_master.name }
    end

    assert_redirected_to efficacy_master_path(assigns(:efficacy_master))
  end

  test "should show efficacy_master" do
    get :show, id: @efficacy_master
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @efficacy_master
    assert_response :success
  end

  test "should update efficacy_master" do
    patch :update, id: @efficacy_master, efficacy_master: { code: @efficacy_master.code, name: @efficacy_master.name }
    assert_redirected_to efficacy_master_path(assigns(:efficacy_master))
  end

  test "should destroy efficacy_master" do
    assert_difference('EfficacyMaster.count', -1) do
      delete :destroy, id: @efficacy_master
    end

    assert_redirected_to efficacy_masters_path
  end
end
