class Answer < ApplicationRecord
  MAX_COUNT = 4

  belongs_to :question

  validates :body, presence: true
  validate :validate_count_in_one_question, on: :create

  scope :correct, -> {where(correct: true)}

  private

  def validate_count_in_one_question
    errors.add(:base, "Уже создано больше 4х ответов на данный вопрос: #{question.body}") if question.answers.count >= MAX_COUNT
  end
end
