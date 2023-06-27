class BadgeRule < ApplicationRecord
  has_many :badges, class_name:'Badge', foreign_key: :rule_id
end
