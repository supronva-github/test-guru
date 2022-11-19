class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :users_tests
  has_many :users, through: :users_tests
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  def self.sort_by_category(name)
    joins(:category).where(categories: {title: name}).order(title: :asc).pluck(:title)
  end
end
