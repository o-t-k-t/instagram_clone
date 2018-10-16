class FeedMailer < ApplicationMailer
  def feed_mail(feed)
    @feed = feed

    binding.pry

    mail to: @feed.email, subject: 'フィード投稿確認メール'
  end
end
