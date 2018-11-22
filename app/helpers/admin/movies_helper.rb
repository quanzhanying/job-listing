module Admin::MoviesHelper

  def render_movie_status(movie)
    if movie.is_hidden
      content_tag(:span, "", :class => "fa fa-lock")
    else
      content_tag(:span, "", :class => "fa fa-globe")
    end
  end
end
