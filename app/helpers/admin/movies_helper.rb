module Admin::MoviesHelper

  def render_movie_status(movie)
    if movie.is_hidden
      "(Hidden)"
    else
      "(Public)"
    end
  end
end
