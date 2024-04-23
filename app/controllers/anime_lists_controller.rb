class AnimeListsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy, :update_episodes_watched]
  before_action :set_anime_list, only: [:show, :update, :destroy, :update_episodes_watched]
  before_action :authorize_user!, only: [:update, :destroy]
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format =~ /^application\/json/ }

  def index
    @anime_lists = AnimeList.where(user_id: params[:user_id]).includes(:animes)
    render json: @anime_lists
  end

  def show
    @anime_list = AnimeList.find(params[:id])
    render json: @anime_list
  end

  def create
    @anime_list = AnimeList.new(create_params)
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
    if @anime_list.update(update_params)
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
    @anime_list = AnimeList.find_by(id: params[:id])

    if @anime_list
      @anime_list.destroy
      render json: { message: 'Anime list was successfully destroyed.', anime_list: @anime_list}
    else
      render json: { error: 'Anime list not found.' }, status: :not_found
    end
  end

  def update_episodes_watched
    user_anime = @anime_list.user_animes.find_by(anime_id: update_episodes_watched_params[:anime_id])

    if user_anime
      user_anime.update(episodes_watched: update_episodes_watched_params[:episodes_watched])
      render json: user_anime
    else
      render json: { error: 'User anime not found.' }, status: :not_found
    end
  end

  private

  def set_anime_list
    @anime_list = AnimeList.find(params[:id])
  end

  def authorize_user!
    unless @anime_list.user == current_user
      render json: { error: 'You are not authorized to perform this action.' }, status: :unauthorized
    end
  end

  def create_params
    params.require(:anime_list).permit(:name).merge(user_id: params[:user_id])
  end

  def update_params
    params.require(:anime_list).permit(:name)
  end

  def update_episodes_watched_params
    params.permit(:anime_id, :episodes_watched)
  end
end
