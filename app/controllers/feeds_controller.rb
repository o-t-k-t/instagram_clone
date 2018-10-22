class FeedsController < ApplicationController
  before_action :require_logged_in, except: %i[index]
  before_action :set_current_user_feed, only: %i[edit update destroy]

  def index
    @feeds = Feed.all.order('created_at desc')
    @favorite_feeds = current_user&.favorite_feeds
    @favorite = Favorite.new
  end

  def new
    @feed =
      if params[:back]
        Feed.new(feed_params)
      else
        Feed.new
      end
  end

  def edit
  end

  def create
    @feed = Feed.new(feed_params)
    @feed.save!

    FeedMailer.feed_mail(@feed).deliver
    redirect_to feeds_path
  end

  def update
    if @feed.update(feed_params)
      redirect_to feeds_path
    else
      render :edit
    end
  end

  def destroy
    @feed.delete
    redirect_to feeds_path
  end

  def confirm
    @feed = Feed.new(feed_params)
    @feed.user_id = current_user.id
    render :new and return if @feed.invalid?
  end

  private

  def feed_params
    params.require(:feed).permit(:description, :image, :image_cache, :user_id)
  end

  def set_current_user_feed
    @feed = cuurent_user.feeds.find_by_id(params[:id])
    redirect_to feeds_path unless @feed
  end
end
