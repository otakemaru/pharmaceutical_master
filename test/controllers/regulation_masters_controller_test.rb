require 'test_helper'

class RegulationMastersControllerTest < ActionController::TestCase
  setup do
    @regulation_master = regulation_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:regulation_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create regulation_master" do
    assert_difference('RegulationMaster.count') do
      post :create, regulation_master: { code: @regulation_master.code, name: @regulation_master.name }
    end

    assert_redirected_to regulation_master_path(assigns(:regulation_master))
  end

  test "should show regulation_master" do
    get :show, id: @regulation_master
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @regulation_master
    assert_response :success
  end

  test "should update regulation_master" do
    patch :update, id: @regulation_master, regulation_master: { code: @regulation_master.code, name: @regulation_master.name }
    assert_redirected_to regulation_master_path(assigns(:regulation_master))
  end

  test "should destroy regulation_master" do
    assert_difference('RegulationMaster.count', -1) do
      delete :destroy, id: @regulation_master
    end

    assert_redirected_to regulation_masters_path
  end
end
