module TestPassagesHelper
  def color_result(test_passage)
    if test_passage.success?
      'success'
    else
      'fail'
    end
  end

  def test_result(test_passage)
    if test_passage.success?
      'Тест выполнен'
    else
      'Тест не выполнен'
    end
  end
end
