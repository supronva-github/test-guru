module AnswersHelper
  def answer_header(answer)
    if answer.new_record?
      I18n.t('helper_methods.answer.new_record', record: answer.question.body)
    else
      I18n.t('helper_methods.answer.not_new_record', record: answer.question.body)
    end
  end
end
