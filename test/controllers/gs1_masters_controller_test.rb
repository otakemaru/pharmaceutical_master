require 'test_helper'

class Gs1MastersControllerTest < ActionController::TestCase
  setup do
    @gs1_master = gs1_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gs1_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gs1_master" do
    assert_difference('Gs1Master.count') do
      post :create, gs1_master: { a: @gs1_master.a, aa: @gs1_master.aa, ab: @gs1_master.ab, ac: @gs1_master.ac, ad: @gs1_master.ad, ae: @gs1_master.ae, af: @gs1_master.af, ag: @gs1_master.ag, ah: @gs1_master.ah, ai: @gs1_master.ai, aj: @gs1_master.aj, b: @gs1_master.b, ba: @gs1_master.ba, bb: @gs1_master.bb, bc: @gs1_master.bc, bd: @gs1_master.bd, be: @gs1_master.be, bf: @gs1_master.bf, bg: @gs1_master.bg, bh: @gs1_master.bh, bi: @gs1_master.bi, bj: @gs1_master.bj, c: @gs1_master.c, ca: @gs1_master.ca, cb: @gs1_master.cb, cc: @gs1_master.cc, cd: @gs1_master.cd, ce: @gs1_master.ce, cf: @gs1_master.cf, cg: @gs1_master.cg, ch: @gs1_master.ch, ci: @gs1_master.ci, cj: @gs1_master.cj, d: @gs1_master.d, da: @gs1_master.da, db: @gs1_master.db, dc: @gs1_master.dc, dd: @gs1_master.dd, e: @gs1_master.e, f: @gs1_master.f, g: @gs1_master.g, h: @gs1_master.h, i: @gs1_master.i, j: @gs1_master.j }
    end

    assert_redirected_to gs1_master_path(assigns(:gs1_master))
  end

  test "should show gs1_master" do
    get :show, id: @gs1_master
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gs1_master
    assert_response :success
  end

  test "should update gs1_master" do
    patch :update, id: @gs1_master, gs1_master: { a: @gs1_master.a, aa: @gs1_master.aa, ab: @gs1_master.ab, ac: @gs1_master.ac, ad: @gs1_master.ad, ae: @gs1_master.ae, af: @gs1_master.af, ag: @gs1_master.ag, ah: @gs1_master.ah, ai: @gs1_master.ai, aj: @gs1_master.aj, b: @gs1_master.b, ba: @gs1_master.ba, bb: @gs1_master.bb, bc: @gs1_master.bc, bd: @gs1_master.bd, be: @gs1_master.be, bf: @gs1_master.bf, bg: @gs1_master.bg, bh: @gs1_master.bh, bi: @gs1_master.bi, bj: @gs1_master.bj, c: @gs1_master.c, ca: @gs1_master.ca, cb: @gs1_master.cb, cc: @gs1_master.cc, cd: @gs1_master.cd, ce: @gs1_master.ce, cf: @gs1_master.cf, cg: @gs1_master.cg, ch: @gs1_master.ch, ci: @gs1_master.ci, cj: @gs1_master.cj, d: @gs1_master.d, da: @gs1_master.da, db: @gs1_master.db, dc: @gs1_master.dc, dd: @gs1_master.dd, e: @gs1_master.e, f: @gs1_master.f, g: @gs1_master.g, h: @gs1_master.h, i: @gs1_master.i, j: @gs1_master.j }
    assert_redirected_to gs1_master_path(assigns(:gs1_master))
  end

  test "should destroy gs1_master" do
    assert_difference('Gs1Master.count', -1) do
      delete :destroy, id: @gs1_master
    end

    assert_redirected_to gs1_masters_path
  end
end
