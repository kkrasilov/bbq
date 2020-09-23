class ApplicationMailer < ActionMailer::Base
  default from: Rails.application.credentials.mail[:name]
  layout 'mailer'
end
