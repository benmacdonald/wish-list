class ApplicationMailer < ActionMailer::Base
  default from: 'decode2017shopify@gmail.com'
  #layout 'mailer'

  def notify_consumers(users)
    attachments.inline["logo.png"] = File.read("#{Rails.root}/app/assets/images/logo.png")
    users.each do |user|
      @user = user
      mail(to: user.email, subject: "The Item you wanted is now on sale!")
    end
  end

end
