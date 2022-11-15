class User < ApplicationRecord
  has_many :users_tests
  has_many :tests, through: :users_tests
end
