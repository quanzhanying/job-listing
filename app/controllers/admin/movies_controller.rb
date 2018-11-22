class Admin::MoviesController < ApplicationController
  before_action :authenticate_user!, only: %i(new create update edit destroy)
  before_action :require_is_admin
  layout "admin"
  def show
    @movie = Movie.find(params[:id])
  end

  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to admin_movies_path
    else
      render :new
    end
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      redirect_to admin_movies_path
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to admin_movies_path
  end

  def publish
    @movie = Movie.find(params[:id])
    @movie.publish!
    redirect_to :back
  end

  def hide
    @movie = Movie.find(params[:id])
    @movie.hide!
    redirect_to :back
  end

  private
    def movie_params
      params.require(:movie).permit(:title, :description, :douban, :is_hidden)
    end

end
