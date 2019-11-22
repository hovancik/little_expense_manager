require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test "all_by_the_most_used works" do
    assert [categories(:two), categories(:one)], Category.all_by_the_most_used(accounts(:one).id)
  end

  test "has_bucket?" do
    assert categories(:one).has_bucket?
    assert !categories(:two).has_bucket?
  end
end
