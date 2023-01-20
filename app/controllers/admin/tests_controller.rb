class Admin::TestsController < Admin::BaseController
  def index
    @tests = Test.all
  end
  
  def new
    @test = Test.new
  end

  def create
    @test = current_user.owner_tests.new(test_params)
    if @test.save
      redirect_to admin_tests_path
    else
      render :new
    end
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end
end
