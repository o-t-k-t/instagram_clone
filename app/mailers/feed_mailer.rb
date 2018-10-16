class FeedMailer < ApplicationMailer
  def feed_mail(feed)
    @feed = feed
    mail to: @feed.email, subject: 'フィード投稿確認メール'
  end
end
