require 'test_helper'

class FaxesControllerTest < ActionController::TestCase
  setup do
    @faxis = faxes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:faxes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create faxis" do
    assert_difference('Fax.count') do
      post :create, faxis: { address_id: @faxis.address_id, label: @faxis.label, number: @faxis.number }
    end

    assert_redirected_to faxis_path(assigns(:faxis))
  end

  test "should show faxis" do
    get :show, id: @faxis
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @faxis
    assert_response :success
  end

  test "should update faxis" do
    put :update, id: @faxis, faxis: { address_id: @faxis.address_id, label: @faxis.label, number: @faxis.number }
    assert_redirected_to faxis_path(assigns(:faxis))
  end

  test "should destroy faxis" do
    assert_difference('Fax.count', -1) do
      delete :destroy, id: @faxis
    end

    assert_redirected_to faxes_path
  end
end
