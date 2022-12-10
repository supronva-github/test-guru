class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index create new]
  before_action :find_question, only: [:show, :destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_question_not_found

  def index
    @questions = @test.questions
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      render inline: 'Вопрос: <%= @question.body %> - создан'
    else
      render plain: 'Error'
    end
  end

  def destroy
    @question.destroy
    render plain: "Вопрос #{@question.id} - удален"
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

  def question_params
    params.require(:question).permit(:body)
  end
end
