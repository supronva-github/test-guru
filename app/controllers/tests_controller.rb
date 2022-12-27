class TestsController < ApplicationController
  before_action :find_user, only: %i[start]

  def index
    @tests = Test.all
  end

  def start
    @test = Test.find(params[:id])
    @user.tests.push(@test)
    redirect_to @user.test_passage(@test)
  end

  private

  def find_user
    @user = User.first
  end
end
