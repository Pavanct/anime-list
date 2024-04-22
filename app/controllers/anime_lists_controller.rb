class AnimeListsController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    @anime_lists = AnimeList.where(user_id: params[:user_id]).includes(:animes)
    render json: @anime_lists
  end

  def create
    @anime_list = AnimeList.new(anime_list_params)
    @anime_list.user_id = params[:user_id]

    if @anime_list.save
      params[:anime_ids].each do |anime_id|
        UserAnime.create(anime_list: @anime_list, anime_id: anime_id, user_id: params[:user_id])
      end

      render json: @anime_list, status: :created
    else
      render json: @anime_list.errors, status: :unprocessable_entity
    end
  end

  def update

  end

  def destroy

  end

  private

  def anime_list_params
    params.require(:anime_list).permit(:name)
  end
end
