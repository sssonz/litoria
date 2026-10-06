require "test_helper"

class ChaptersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    chapter = chapters(:one)

    get work_chapter_url(chapter.work, chapter)

    assert_response :success
  end
end
