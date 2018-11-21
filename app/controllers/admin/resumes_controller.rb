class Admin::ResumesController < ApplicationController
  before_action :authenticate_user!
  before_action :require_is_admin
  layout 'admin'

  def index
    @movie = Movie.find(params[:movie_id])
    @resumes = @movie.resumes.order('created_at DESC')
  end
end
