class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :users_tests
  has_many :users, through: :users_tests
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  scope :easy, -> {where(level: 0..1)}
  scope :medium, -> {where(level: 2..4)}
  scope :hard, -> {where(level: 5..Float::INFINITY)}
  scope :by_level, -> (level) {where(level: level)}

  def self.sort_by_category(name)
    joins(:category).where(categories: {title: name}).order(title: :asc).pluck(:title)
  end
end
