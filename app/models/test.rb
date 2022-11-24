class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :users_tests
  has_many :users, through: :users_tests
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  validates :title, presence: true
  validates :level, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  scope :easy, -> {by_level(0..1)}
  scope :medium, -> {by_level(2..4)}
  scope :hard, -> {by_level (5..Float::INFINITY)}
  scope :by_level, -> (level) {where(level: level)}
  scope :by_category, -> (name) {joins(:category).where(categories: {title: name})}

  def self.sort_by_category(name)
    by_category(name).order(title: :desc).pluck(:title)
  end
end
