module TestPassagesHelper
  def test_result(test_passage)
    if test_passage.success?
     "<p>#{I18n.t('helper_methods.test_passages.test_success')}<span class='success'>#{@test_passage.percent_correct_answers}%</span></p>".html_safe
    else
      "<p>#{I18n.t('helper_methods.test_passages.test_failed')}<span class='fail'>#{@test_passage.percent_correct_answers}%</span></p>".html_safe
    end
  end
end
