class ApplicationMailer < ActionMailer::Base
  default from: 'decode2017shopify@gmail.com'
  #layout 'mailer'

  def notify_consumers(users)
    puts("emailing: ")
    wishlists.each do |user|
      puts(user.email)
      @user = user
      mail(to: user.email, subject: "The Item you wanted is now on sale!")
    end
  end

end
