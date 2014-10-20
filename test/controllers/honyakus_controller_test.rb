require 'test_helper'

class HonyakusControllerTest < ActionController::TestCase
  setup do
    @honyaku = honyakus(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:honyakus)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create honyaku" do
    assert_difference('Honyaku.count') do
      post :create, honyaku: { name: @honyaku.name, question_body: @honyaku.question_body }
    end

    assert_redirected_to honyaku_path(assigns(:honyaku))
  end

  test "should show honyaku" do
    get :show, id: @honyaku
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @honyaku
    assert_response :success
  end

  test "should update honyaku" do
    patch :update, id: @honyaku, honyaku: { name: @honyaku.name, question_body: @honyaku.question_body }
    assert_redirected_to honyaku_path(assigns(:honyaku))
  end

  test "should destroy honyaku" do
    assert_difference('Honyaku.count', -1) do
      delete :destroy, id: @honyaku
    end

    assert_redirected_to honyakus_path
  end
end
