class AchievementService
  def initialize(test_passage)
    @test_passage = test_passage
    @test = test_passage.test
    @user = test_passage.user
  end

  def call

    Badge.all.each do |badge|
      if send("#{badge.rule.parameter}?", badge.rule.options)
        reward(badge)
      end
    end
  end

  private

  def reward(badge)
    @user.badges << badge
  end
 
  def first_try?(_)
    @user.test_passages.where(test_id: @test.id).count == 1
  end

  def category_complete?(category)
    all_ready_tests_by_category = Test.ready_test.by_category(category)
    
    user_finished_all_tests_by_category = all_ready_tests_by_category.all? do |test|
      @user.test_passages.where(test_id: test.id, finished: true).exists?
    end
  end

  def level_complete?(level)
    all_ready_tests_by_level = Test.ready_test.by_level(level)

    user_finished_all_tests_by_level = all_ready_tests_by_level.all? do |test|
      @user.test_passages.where(test_id: test.id, finished: true).exists?
    end
  end
end
