class User < ApplicationRecord
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :owner_tests, class_name: 'Test', foreign_key: :author_id

  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  def test_by_level(level)
    tests.by_level(level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
 