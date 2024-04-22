class AnimeListsController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    @anime_lists = AnimeList.where(user_id: params[:user_id]).includes(:animes)
    render json: @anime_lists
  end

  def show
    @anime_list = AnimeList.find(params[:id])
    render json: @anime_list
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
    @anime_list = AnimeList.find(params[:id])
    if @anime_list.update(anime_list_params)
      if params[:anime_ids].present?
        current_anime_ids = @anime_list.animes.pluck(:id)
        new_anime_ids = params[:anime_ids].map(&:to_i)

        animes_to_add = new_anime_ids - current_anime_ids
        animes_to_remove = current_anime_ids - new_anime_ids

        animes_to_add.each do |anime_id|
          UserAnime.create(anime_list: @anime_list, anime_id: anime_id, user_id: params[:user_id])
        end

        @anime_list.user_animes.where(anime_id: animes_to_remove).destroy_all
      end

      render json: @anime_list
    else
      render json: @anime_list.errors, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def anime_list_params
    params.require(:anime_list).permit(:name)
  end
end