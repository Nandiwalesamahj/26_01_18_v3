require 'test_helper'

class SandarbhsuchisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sandarbhsuchi = sandarbhsuchis(:one)
  end

  test "should get index" do
    get sandarbhsuchis_url
    assert_response :success
  end

  test "should get new" do
    get new_sandarbhsuchi_url
    assert_response :success
  end

  test "should create sandarbhsuchi" do
    assert_difference('Sandarbhsuchi.count') do
      post sandarbhsuchis_url, params: { sandarbhsuchi: { attachment: @sandarbhsuchi.attachment, description: @sandarbhsuchi.description, link: @sandarbhsuchi.link, title: @sandarbhsuchi.title } }
    end

    assert_redirected_to sandarbhsuchi_url(Sandarbhsuchi.last)
  end

  test "should show sandarbhsuchi" do
    get sandarbhsuchi_url(@sandarbhsuchi)
    assert_response :success
  end

  test "should get edit" do
    get edit_sandarbhsuchi_url(@sandarbhsuchi)
    assert_response :success
  end

  test "should update sandarbhsuchi" do
    patch sandarbhsuchi_url(@sandarbhsuchi), params: { sandarbhsuchi: { attachment: @sandarbhsuchi.attachment, description: @sandarbhsuchi.description, link: @sandarbhsuchi.link, title: @sandarbhsuchi.title } }
    assert_redirected_to sandarbhsuchi_url(@sandarbhsuchi)
  end

  test "should destroy sandarbhsuchi" do
    assert_difference('Sandarbhsuchi.count', -1) do
      delete sandarbhsuchi_url(@sandarbhsuchi)
    end

    assert_redirected_to sandarbhsuchis_url
  end
end
