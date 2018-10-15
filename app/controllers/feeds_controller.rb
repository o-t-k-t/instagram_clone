class FeedsController < ApplicationController
  def index
    @feeds = Feed.all.order('created_at desc')
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
    @feed = Feed.find(params[:id])
  end

  def create
    Feed.create!(feed_params)
    redirect_to feeds_path
  end

  def update
    if Feed.find(params[:id])&.update(feed_params)
      redirect_to feeds_path
    else
      render :edit
    end
  end

  def destroy
    Feed.find(params[:id]).delete
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
end
