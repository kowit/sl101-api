require "test_helper"

class BusinessTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @business_type = business_types(:one)
  end

  test "should get index" do
    get business_types_url, as: :json
    assert_response :success
  end

  test "should create business_type" do
    assert_difference("BusinessType.count") do
      post business_types_url, params: { business_type: { name: @business_type.name } }, as: :json
    end

    assert_response :created
  end

  test "should show business_type" do
    get business_type_url(@business_type), as: :json
    assert_response :success
  end

  test "should update business_type" do
    patch business_type_url(@business_type), params: { business_type: { name: @business_type.name } }, as: :json
    assert_response :success
  end

  test "should destroy business_type" do
    assert_difference("BusinessType.count", -1) do
      delete business_type_url(@business_type), as: :json
    end

    assert_response :no_content
  end
end
