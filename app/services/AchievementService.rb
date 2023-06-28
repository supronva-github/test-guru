class AchievementService
  def initialize(test_passage)
    @test_passage = test_passage
    @test = test_passage.test
    @user = test_passage.user
  end

  def call
    Badge.all.each do |badge|
      case badge.rule.parameter
      when 'category_complete'
        reward(badge) if category_complete?(badge.rule.options)
      when 'first_try'
        reward(badge) if first_try?
      when 'level_complete'
        reward(badge) if level_complete?(badge.rule.options.to_i)
      end
    end
  end

  private

  def reward(badge)
    @user.badges << badge
  end

  def successful_test?
    @test_passage.successfully?
  end

  def first_try?
    successful_test? && @user.tests.where(id: @test.id).count == 1
  end

  def category_complete?(category)
    successful_test? && @test.category.title == category
  end

  def level_complete?(level)
    successful_test? && @test.level == level
  end
end
