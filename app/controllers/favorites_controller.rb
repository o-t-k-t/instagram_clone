class FavoritesController < ApplicationController
  def index
    @feeds = current_user.favorite_feeds
                         .includes(:favorites)
                         .order('favorites.created_at')
  end

  def create
    fav = current_user.favorites.new(feed_id: params[:feed_id])
    notice = 
      if fav.save
        'お気に入り登録しました'
      else
        'すでにお気に入りのフィードです'
      end
    redirect_to favorites_path, notice: notice
  end

  def destroy
    current_user.favorites
                .find_by_id(params[:id])
                .destroy
    redirect_to feeds_path
  end
end
