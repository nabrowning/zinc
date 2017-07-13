require 'test_helper'

class MacbethControllerTest < ActionDispatch::IntegrationTest
  test "should get line_counts" do
    get macbeth_line_counts_url
    assert_response :success
  end

end
