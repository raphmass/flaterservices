require 'test_helper'

class AssignementsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get assignements_index_url
    assert_response :success
  end

  test "should get show" do
    get assignements_show_url
    assert_response :success
  end

  test "should get new" do
    get assignements_new_url
    assert_response :success
  end

  test "should get create" do
    get assignements_create_url
    assert_response :success
  end

  test "should get edit" do
    get assignements_edit_url
    assert_response :success
  end

  test "should get update" do
    get assignements_update_url
    assert_response :success
  end

  test "should get destroy" do
    get assignements_destroy_url
    assert_response :success
  end

end
