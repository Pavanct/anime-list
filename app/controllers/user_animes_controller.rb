class UserAnimesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @user_animes = @user.user_animes
    render json: @user_animes
  end

  def show
    @user_anime = UserAnime.find(params[:id])
    render json: @user_anime
  end

  # Todo CUD actions for UserAnime
end
