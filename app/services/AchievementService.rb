class AchievementService
  def initialize(test_passage)
    @test_passage = test_passage
    @test = test_passage.test
    @user = test_passage.user
  end

  def call
    Badge.all.each do |badge|
      reward(badge) if send("#{badge.rule.parameter}?", badge.rule.options)
    end
  end

  private

  def reward(badge)
    @user.badges << badge unless @user.badges.exists?(id: badge.id)
  end

  def first_try?(_)
    @user.test_passages.where(test_id: @test.id, finished: true).count == 1
  end

  def category_complete?(category)
    ready_tests_by_category = Test.ready_test.by_category(category)
    ready_tests_by_category_ids = ready_tests_by_category.ids

    user_finished_tests_by_category = @user.test_passages.where(test_id: ready_tests_by_category
                                                         .pluck(:id), finished: true)
    user_finished_tests_by_category_ids = user_finished_tests_by_category.pluck(:test_id).uniq

    ready_tests_by_category_ids == user_finished_tests_by_category_ids
  end

  def level_complete?(level)
    all_ready_tests_by_level = Test.ready_test.by_level(level)
    all_ready_tests_by_level_ids = all_ready_tests_by_level.ids

    user_finished_tests_by_level = @user.test_passages.where(test_id: all_ready_tests_by_level
                                                      .pluck(:id), finished: true)
    user_finished_tests_by_level_ids = user_finished_tests_by_level.pluck(:test_id).uniq

    all_ready_tests_by_level_ids == user_finished_tests_by_level_ids
  end
end
