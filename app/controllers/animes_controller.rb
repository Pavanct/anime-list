class AnimesController < ApplicationController
  def index
    @animes = Anime.order(sort_column + ' ' + sort_direction)

    if params[:title]
      @animes = @animes.where('title LIKE ?', "%#{params[:title]}%")
    end

    if params[:genre]
      @animes = @animes.where('genre LIKE ?', "%#{params[:genre]}%")
    end

    @animes = @animes.page(params[:page] || 1).per(params[:per_page] || 25)

    # render json or html based on request format
    respond_to do |format|
      format.html
      format.json { render json: @animes }
    end
  end

  def show
    render json: Anime.find(params[:id])
  end

  private

  def sort_column
    Anime.column_names.include?(params[:sort]) ? params[:sort] : 'id'
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
  end
end
