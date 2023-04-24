class TestsController < ApplicationController
  def index
    @tests = Test.ready_test
  end

  def start
    @test = Test.find(params[:id])
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end
end
