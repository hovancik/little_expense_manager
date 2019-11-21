require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  test "test has_buckets?" do
    assert accounts(:one).has_buckets?
    assert !accounts(:two).has_buckets?
  end
end
