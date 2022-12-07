class QuestionsController < ApplicationController
  before_action :find_test, only: [:index]
  before_action :find_question, only: [:show]

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
end
