class AddCurrentQuestionAndCorrectQuestionsToTestPassages < ActiveRecord::Migration[6.1]
  def change
    add_column :test_passages, :correct_questions, :integer, default: 0
    add_reference :test_passages, :correct_question, foreign_key: { to_table: :questions }
  end
end
