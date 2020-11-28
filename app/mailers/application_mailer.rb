class ApplicationMailer < ActionMailer::Base
  default from: Rails.application.credentials.fetch(:mail, name: 'test@test.com')[:name]
  layout 'mailer'
end
