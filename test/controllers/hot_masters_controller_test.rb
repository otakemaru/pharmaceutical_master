require 'test_helper'

class HotMastersControllerTest < ActionController::TestCase
  setup do
    @hot_master = hot_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hot_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hot_master" do
    assert_difference('HotMaster.count') do
      post :create, hot_master: { a: @hot_master.a, aa: @hot_master.aa, ab: @hot_master.ab, ac: @hot_master.ac, ad: @hot_master.ad, ae: @hot_master.ae, af: @hot_master.af, ag: @hot_master.ag, ah: @hot_master.ah, ai: @hot_master.ai, aj: @hot_master.aj, b: @hot_master.b, ba: @hot_master.ba, bb: @hot_master.bb, bc: @hot_master.bc, bd: @hot_master.bd, c: @hot_master.c, d: @hot_master.d, e: @hot_master.e, f: @hot_master.f, g: @hot_master.g, h: @hot_master.h, i: @hot_master.i, j: @hot_master.j }
    end

    assert_redirected_to hot_master_path(assigns(:hot_master))
  end

  test "should show hot_master" do
    get :show, id: @hot_master
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hot_master
    assert_response :success
  end

  test "should update hot_master" do
    patch :update, id: @hot_master, hot_master: { a: @hot_master.a, aa: @hot_master.aa, ab: @hot_master.ab, ac: @hot_master.ac, ad: @hot_master.ad, ae: @hot_master.ae, af: @hot_master.af, ag: @hot_master.ag, ah: @hot_master.ah, ai: @hot_master.ai, aj: @hot_master.aj, b: @hot_master.b, ba: @hot_master.ba, bb: @hot_master.bb, bc: @hot_master.bc, bd: @hot_master.bd, c: @hot_master.c, d: @hot_master.d, e: @hot_master.e, f: @hot_master.f, g: @hot_master.g, h: @hot_master.h, i: @hot_master.i, j: @hot_master.j }
    assert_redirected_to hot_master_path(assigns(:hot_master))
  end

  test "should destroy hot_master" do
    assert_difference('HotMaster.count', -1) do
      delete :destroy, id: @hot_master
    end

    assert_redirected_to hot_masters_path
  end
end
