require 'test_helper'

class PharmaceuticalMastersControllerTest < ActionController::TestCase
  setup do
    @pharmaceutical_master = pharmaceutical_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pharmaceutical_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pharmaceutical_master" do
    assert_difference('PharmaceuticalMaster.count') do
      post :create, pharmaceutical_master: { a: @pharmaceutical_master.a, aa: @pharmaceutical_master.aa, ab: @pharmaceutical_master.ab, ac: @pharmaceutical_master.ac, ad: @pharmaceutical_master.ad, ae: @pharmaceutical_master.ae, af: @pharmaceutical_master.af, ag: @pharmaceutical_master.ag, b: @pharmaceutical_master.b, c: @pharmaceutical_master.c, d: @pharmaceutical_master.d, e: @pharmaceutical_master.e, f: @pharmaceutical_master.f, g: @pharmaceutical_master.g, h: @pharmaceutical_master.h, i: @pharmaceutical_master.i, j: @pharmaceutical_master.j }
    end

    assert_redirected_to pharmaceutical_master_path(assigns(:pharmaceutical_master))
  end

  test "should show pharmaceutical_master" do
    get :show, id: @pharmaceutical_master
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pharmaceutical_master
    assert_response :success
  end

  test "should update pharmaceutical_master" do
    patch :update, id: @pharmaceutical_master, pharmaceutical_master: { a: @pharmaceutical_master.a, aa: @pharmaceutical_master.aa, ab: @pharmaceutical_master.ab, ac: @pharmaceutical_master.ac, ad: @pharmaceutical_master.ad, ae: @pharmaceutical_master.ae, af: @pharmaceutical_master.af, ag: @pharmaceutical_master.ag, b: @pharmaceutical_master.b, c: @pharmaceutical_master.c, d: @pharmaceutical_master.d, e: @pharmaceutical_master.e, f: @pharmaceutical_master.f, g: @pharmaceutical_master.g, h: @pharmaceutical_master.h, i: @pharmaceutical_master.i, j: @pharmaceutical_master.j }
    assert_redirected_to pharmaceutical_master_path(assigns(:pharmaceutical_master))
  end

  test "should destroy pharmaceutical_master" do
    assert_difference('PharmaceuticalMaster.count', -1) do
      delete :destroy, id: @pharmaceutical_master
    end

    assert_redirected_to pharmaceutical_masters_path
  end
end
