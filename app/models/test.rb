class Test < ApplicationRecord
  belongs_to :category
  has_many :test_passages, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :users, through: :test_passages
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  validates :title, presence: true,
                    uniqueness: { scope: :level, message: 'There can only be one test with the same name and level' }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  scope :easy, -> { by_level(0..1) }
  scope :medium, -> { by_level(2..4) }
  scope :hard, -> { by_level(5..Float::INFINITY) }
  scope :by_level, ->(level) { where(level: level) }
  scope :by_category, ->(name) { joins(:category).where(categories: { title: name }) }
  scope :with_questions, -> { joins(:questions).distinct }
  scope :ready_test, -> { where(active: true) }

  def self.sort_by_category(name)
    by_category(name).order(title: :desc).pluck(:title)
  end
end
