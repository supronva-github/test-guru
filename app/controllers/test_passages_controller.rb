class TestPassagesController < ApplicationController
  before_action :find_test_passage, only: %i[show result update gist]

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    service = GistQuestionService.new(@test_passage.current_question)
    gist_response = service.call

    if service.success?

      current_user.gists.create(question: @test_passage.current_question, url: gist_response.html_url)
      flash[:notice] = t('.success', url: gist_response.html_url)
    else
      flash[:alert] = t('.failure')
    end
    
    redirect_to @test_passage
  end

  private

  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
