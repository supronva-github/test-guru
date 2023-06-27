class Badge < ApplicationRecord
  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges
  belongs_to :rule, class_name: 'BadgeRule', foreign_key: :rule_id

  validates :name, :image, :rule, presence: true

  mount_uploader :image, ImageUploader
end
