class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def notice_email(user)
    @user = user
    mail(to: @user.email, subject: '病院からのお知らせ')
  end
end
