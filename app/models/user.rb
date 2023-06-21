class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :owner_tests, class_name: 'Test', foreign_key: :author_id
  has_many :gists
  has_many :feedbacks
  has_many :user_badges, dependent: :destroy
  has_many :badges, through: :user_badges

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  def test_by_level(level)
    tests.by_level(level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    is_a?(Admin)
  end
end
