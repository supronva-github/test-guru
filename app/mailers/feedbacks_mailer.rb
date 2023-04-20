class FeedbacksMailer < ApplicationMailer
  before_action :find_admin

  def feedback_message(feedback)
    @feedback = feedback

    mail to: @admin.email, from: @feedback.user.email, subject: t('mailers.feedbacks.feedback_message.subject')
  end

  private

  def find_admin
    @admin = Admin.first
  end
end
