class ApplicationMailer < ActionMailer::Base
  default from: 'decode2017shopify@gmail.com'
  #layout 'mailer'

  def notify_consumers(users)
    print "emailing: "
    print users
    wishlists.each do |user|
      @user = user
      mail(to: user.email, subject: "The Item you wanted is now on sale!")
    end
  end

end
