class AnimesController < ApplicationController
  def index
    @animes = Anime.order(:id)

    if params[:title]
      @animes = @animes.where('title LIKE ?', "%#{params[:title]}%")
    end

    if params[:genre]
      @animes = @animes.where('genre LIKE ?', "%#{params[:genre]}%")
    end

    @animes = @animes.page(params[:page] || 1).per(params[:per_page] || 25)

    render json: @animes
  end

  def show
    render json: Anime.find(params[:id])
  end
end
