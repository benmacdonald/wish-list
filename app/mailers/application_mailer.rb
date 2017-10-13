class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'

  def notify_consumers(users)
    wishlists.each do |user|
      mail(to: user.email, subject: "The Item you wanted is on sale!")
    end
  end

end
