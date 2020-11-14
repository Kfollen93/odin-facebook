require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'invalid without name' do
    user = User.new(name: 'John')
    refute user.valid?, 'user is valid without a name'
    assert_not_nil user.errors[:name], 'no validation error for name present'
  end

  test 'invalid without email' do
    user = User.new(email: 'john@example.com')
    refute user.valid?, 'user is valid without a name'
    assert_not_nil user.errors[:email], 'no validation error for email present'
  end

  test 'invalid without password' do
    user = User.new(password: 'testing')
    refute user.valid?, 'user is valid without a password'
    assert_not_nil user.errors[:password], 'no validation error for password present'
  end

end
