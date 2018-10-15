class FavoritesController < ApplicationController
  def index
    @feeds = current_user.favorite_feeds
                         .includes(:favorites)
                         .order('favorites.created_at')
  end

  def create
    current_user.favorites
                .create(feed_id: params[:feed_id])
    redirect_to feeds_path
  end

  def destroy
    current_user.favorites
                .find_by(feed_id: params[:feed_id])
                .destroy
    redirect_to feeds_path
  end
end
