class User < ApplicationRecord
  has_many :users_tests
  has_many :tests, through: :users_tests

  def show_all_tests_for_the_selected_level(level)
    tests.where(level: level)
  end
end
