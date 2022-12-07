class QuestionsController < ApplicationController
  before_action :find_test, only: [:index]
  before_action :find_question, only: [:show]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_question_not_found

  def index
    @questions = @test.questions
    render inline: 'Тесты: <%@questions.each do |q| %><p><%= q.body %></p><% end %>'
  end

  def show
    render plain: @question.body
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_question_not_found
    render plain: 'Вопрос не был найден'
  end
end
