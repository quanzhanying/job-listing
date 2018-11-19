class MoviesController < ApplicationController
before_action :authenticate_user!, only: %i(new create update edit destroy)

def index
  @movies = Movie.where(:is_hidden => false ).order("created_at DESC")
  @movies = case params[:order]
  when 'by_douban'
    Movie.published.order('douban DESC')
  else
    Movie.published.recent
  end
end


def new
  @movie = Movie.new
end

def show
  @movie = Movie.find(params[:id])
  if @movie.is_hidden
    flash[:warning] = "This Movie already archived"
    redirect_to root_path
  end
end

def create
  @movie = Movie.new(movie_params)
  if @movie.save
    redirect_to movies_path
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
    redirect_to movies_path
  else
    render :edit
  end
end

def destroy
  @movie = Movie.find(params[:id])
  @movie.destroy
  flash[:alert] = "Movie deleted"
  redirect_to movies_path

end


private

  def movie_params
    params.require(:movie).permit(:title, :description, :douban, :is_hidden)
  end

end
