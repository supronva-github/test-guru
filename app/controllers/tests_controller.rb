class TestsController < ApplicationController
  def index
    @tests = Test.ready_test
  end

  def start
    @test = Test.find(params[:id])
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
    session[:"end_time_#{TestPassage.last.id}"] = Time.now + @test.duration_time.minute if @test.duration_time.present?
  end
end
