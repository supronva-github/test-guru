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
    gist_response = GistQuestionService.new(@test_passage.current_question).call
   
    flash_options = if gist_response 
      { notice: t('.success', url: gist_response.html_url) }
    else
      { alert: t('.failure') }
    end

    current_user.gists.create(question: @test_passage.current_question, url: gist_response.html_url)
    
    redirect_to @test_passage, flash_options
  end

  private

  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
