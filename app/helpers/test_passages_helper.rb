module TestPassagesHelper
  def test_result(test_passage)
    if test_passage.success?
      "<p> Ваш результат: <span class='success'>#{@test_passage.percent_correct_answers}%</span> Тест выполнен </p>".html_safe
    else
      "<p> Ваш результат: <span class='fail'>#{@test_passage.percent_correct_answers}%</span> Тест не выполнен </p>".html_safe
    end
  end
end
