require_relative "test_helper"

class LibraryTest < Minitest::Test
  def test_valid_at_creation
    library = Library.new(branch_name: "Crete", phone_number: "555-888-2323", address:
    	"221B Baker St")
    assert(library.valid?, "Our fixture should be good by default")
  end
end
