class FavoritesController < ApplicationController
  before_action :require_logged_in

  def index
    @favorites = current_user.favorites
                             .includes(:feed)
                             .order('favorites.created_at')
  end

  def create
    notice =
      if current_user.favorites.create(feed_id: params[:feed_id])
        'お気に入り登録しました'
      else
        'すでにお気に入りのフィードです'
      end
    redirect_to favorites_path, notice: notice
  end

  def destroy
    current_user.favorites.find_by_id(params[:id])&.destroy
    redirect_to feeds_path
  end
end
