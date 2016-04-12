require_relative "test_helper"

class BookTest < Minitest::Test

  def test_valid_at_creation
    book = Book.new(title: "What be Happenin", author: "Koolio", isbn: "124567890")
    assert(book.valid?, "Our fixture should be good by default")
  end
end
