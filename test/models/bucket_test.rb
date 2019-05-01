require 'test_helper'

class BucketTest < ActiveSupport::TestCase
  test "set? works" do
    assert_not Bucket.new.set?
    assert_not Bucket.new(amount: 0).set?
    assert Bucket.new(amount: 0.1).set?
    assert Bucket.new(amount: 10).set?
  end

  test "one bucket per category per account" do
    assert_raises(ActiveRecord::RecordNotUnique) do
      Bucket.new(category: categories(:one), account: accounts(:one)).save
    end
  end
end
