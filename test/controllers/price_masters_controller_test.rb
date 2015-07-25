require 'test_helper'

class PriceMastersControllerTest < ActionController::TestCase
  setup do
    @price_master = price_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:price_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create price_master" do
    assert_difference('PriceMaster.count') do
      post :create, price_master: { a: @price_master.a, aa: @price_master.aa, ab: @price_master.ab, ac: @price_master.ac, ad: @price_master.ad, ae: @price_master.ae, af: @price_master.af, ag: @price_master.ag, ah: @price_master.ah, ai: @price_master.ai, aj: @price_master.aj, b: @price_master.b, ba: @price_master.ba, bb: @price_master.bb, bc: @price_master.bc, bd: @price_master.bd, be: @price_master.be, bf: @price_master.bf, bg: @price_master.bg, bh: @price_master.bh, bi: @price_master.bi, bj: @price_master.bj, c: @price_master.c, ca: @price_master.ca, cb: @price_master.cb, cc: @price_master.cc, cd: @price_master.cd, ce: @price_master.ce, d: @price_master.d, e: @price_master.e, f: @price_master.f, g: @price_master.g, h: @price_master.h, i: @price_master.i, j: @price_master.j }
    end

    assert_redirected_to price_master_path(assigns(:price_master))
  end

  test "should show price_master" do
    get :show, id: @price_master
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @price_master
    assert_response :success
  end

  test "should update price_master" do
    patch :update, id: @price_master, price_master: { a: @price_master.a, aa: @price_master.aa, ab: @price_master.ab, ac: @price_master.ac, ad: @price_master.ad, ae: @price_master.ae, af: @price_master.af, ag: @price_master.ag, ah: @price_master.ah, ai: @price_master.ai, aj: @price_master.aj, b: @price_master.b, ba: @price_master.ba, bb: @price_master.bb, bc: @price_master.bc, bd: @price_master.bd, be: @price_master.be, bf: @price_master.bf, bg: @price_master.bg, bh: @price_master.bh, bi: @price_master.bi, bj: @price_master.bj, c: @price_master.c, ca: @price_master.ca, cb: @price_master.cb, cc: @price_master.cc, cd: @price_master.cd, ce: @price_master.ce, d: @price_master.d, e: @price_master.e, f: @price_master.f, g: @price_master.g, h: @price_master.h, i: @price_master.i, j: @price_master.j }
    assert_redirected_to price_master_path(assigns(:price_master))
  end

  test "should destroy price_master" do
    assert_difference('PriceMaster.count', -1) do
      delete :destroy, id: @price_master
    end

    assert_redirected_to price_masters_path
  end
end
