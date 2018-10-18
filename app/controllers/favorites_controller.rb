class FavoritesController < ApplicationController
  before_action :require_logged_in

  def index
    @favorites = current_user.favorites
                             .includes(:feed)
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
                .find(params[:id])
                .destroy
    redirect_to feeds_path
  end
end
