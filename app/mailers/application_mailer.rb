class ApplicationMailer < ActionMailer::Base
  default from: %{"TestGuru" <bots@guru-test.com>}
  layout 'mailer'
end
