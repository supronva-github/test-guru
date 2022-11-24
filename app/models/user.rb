class User < ApplicationRecord
  has_many :users_tests
  has_many :tests, through: :users_tests
  has_many :owner_tests, class_name: 'Test', foreign_key: :author_id

  def test_by_level(level)
    tests.by_level(level)
  end
end
