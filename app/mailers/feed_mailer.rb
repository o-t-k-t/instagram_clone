class FeedMailer < ApplicationMailer
  def feed_mail(feed)
    @feed = feed

    binding.pry

    mail to: 't.okabe1986@gmail.com', subject: 'フィード投稿確認メール'
  end
end
