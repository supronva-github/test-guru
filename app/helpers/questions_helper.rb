module QuestionsHelper
  def question_header(question)
    if question.new_record?
      I18n.t('helper_methods.question.new_record', record: question.test.title)
    else
      I18n.t('helper_methods.question.not_new_record', record: question.test.title)
    end
  end
end
