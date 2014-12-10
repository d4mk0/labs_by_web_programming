require 'test_helper'

class FiliksControllerTest < ActionController::TestCase
  setup do
    @filik = filiks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:filiks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create filik" do
    assert_difference('Filik.count') do
      post :create, filik: { name: @filik.name, size: @filik.size }
    end

    assert_redirected_to filik_path(assigns(:filik))
  end

  test "should show filik" do
    get :show, id: @filik
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @filik
    assert_response :success
  end

  test "should update filik" do
    patch :update, id: @filik, filik: { name: @filik.name, size: @filik.size }
    assert_redirected_to filik_path(assigns(:filik))
  end

  test "should destroy filik" do
    assert_difference('Filik.count', -1) do
      delete :destroy, id: @filik
    end

    assert_redirected_to filiks_path
  end
end
