require "test_helper"

class CardNameTest < ActiveSupport::TestCase

  test "extract both name and title" do
    name, title = CardName.name_and_title("firstname lastname [title]")

    assert_equal "firstname lastname", name
    assert_equal "title", title
  end

  test "extract both name and title including parentheses" do
    name, title = CardName.name_and_title("firstname (known as) lastname [title]")

    assert_equal "firstname (known as) lastname", name
    assert_equal "title", title
  end

  test "extract name if title is missing" do
    name, title = CardName.name_and_title("firstname lastname")

    assert_equal "firstname lastname", name
    assert_nil title
  end

  test "extract name if title is missing closing bracket" do
    name, title = CardName.name_and_title("firstname lastname [title")
    assert_equal "firstname lastname", name
    assert_equal "title", title
  end
end
