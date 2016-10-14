require 'test_helper'

class CompArraysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comp_array = comp_arrays(:one)
  end

  test "should get index" do
    get comp_arrays_url
    assert_response :success
  end

  test "should get new" do
    get new_comp_array_url
    assert_response :success
  end

  test "should create comp_array" do
    assert_difference('CompArray.count') do
      post comp_arrays_url, params: { comp_array: { customer_id: @comp_array.customer_id, description: @comp_array.description, initial_value: @comp_array.initial_value, install_date: @comp_array.install_date, location: @comp_array.location } }
    end

    assert_redirected_to comp_array_url(CompArray.last)
  end

  test "should show comp_array" do
    get comp_array_url(@comp_array)
    assert_response :success
  end

  test "should get edit" do
    get edit_comp_array_url(@comp_array)
    assert_response :success
  end

  test "should update comp_array" do
    patch comp_array_url(@comp_array), params: { comp_array: { customer_id: @comp_array.customer_id, description: @comp_array.description, initial_value: @comp_array.initial_value, install_date: @comp_array.install_date, location: @comp_array.location } }
    assert_redirected_to comp_array_url(@comp_array)
  end

  test "should destroy comp_array" do
    assert_difference('CompArray.count', -1) do
      delete comp_array_url(@comp_array)
    end

    assert_redirected_to comp_arrays_url
  end
end
