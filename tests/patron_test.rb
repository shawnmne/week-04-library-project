require_relative "test_helper"

class PatronTest < Minitest::Test
  def test_valid_at_creation
    patron = Patron.new(name: "Peter Parker", email: "p_parker@yahoo.com")
    assert(patron.valid?, "Our fixture should be good by default")
  end
end
