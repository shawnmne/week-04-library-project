require_relative "test_helper"

class StaffMemberTest < Minitest::Test
  def test_valid_at_creation
    staff_member = StaffMember.new(name: "Kim Deal", email: "k_deal@yahoo.com")
    assert(staff_member.valid?, "Our fixture should be good by default")
  end
end
