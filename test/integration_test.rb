require "application_system_test_case"

class Paginate::IntegrationTest < ApplicationSystemTestCase
  test "recordings are paginated" do
    visit root_path

    within "#recordings" do
      assert_selector "div", count: Paginate::Page::PER_PAGE
    end

    assert_selector "a", text: "Next page"
    assert_no_selector "a", text: "Previous page"
  end
end
