class QuestionsController < ApplicationController
  before_action :find_test

  def index
    @questions = @test.questions
    render inline: 'Тесты: <%@questions.each do |q| %><p><%= q.body %></p><% end %>'
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end
end
