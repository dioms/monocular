require 'test_helper'

class CustomerSetsControllerTest < ActionController::TestCase
  setup do
    @customer_set = customer_sets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:customer_sets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create customer_set" do
    assert_difference('CustomerSet.count') do
      post :create, customer_set: { name: @customer_set.name, rule: @customer_set.rule }
    end

    assert_redirected_to customer_set_path(assigns(:customer_set))
  end

  test "should show customer_set" do
    get :show, id: @customer_set
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @customer_set
    assert_response :success
  end

  test "should update customer_set" do
    patch :update, id: @customer_set, customer_set: { name: @customer_set.name, rule: @customer_set.rule }
    assert_redirected_to customer_set_path(assigns(:customer_set))
  end

  test "should destroy customer_set" do
    assert_difference('CustomerSet.count', -1) do
      delete :destroy, id: @customer_set
    end

    assert_redirected_to customer_sets_path
  end
end
