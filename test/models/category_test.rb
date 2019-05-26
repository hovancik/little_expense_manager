require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test "all_by_the_most_used works" do
    assert [categories(:two), categories(:one)], Category.all_by_the_most_used(accounts(:one).id)
  end
end
