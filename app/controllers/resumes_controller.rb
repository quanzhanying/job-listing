class ResumesController < ApplicationController
  before_action :authenticate_user!

  def new
    @movie = Movie.find(params[:movie_id])
    @resume = Resume.new
  end

  def create
    @movie = Movie.find(params[movie_id])
    @resume = Resume.new(resume_params)
    @resume.movie = @movie
    @resume.user = current_user
  end

  if @resume.save
    flash[:notice] = "成功提交影评"
    redirect_to movie_path(@movie)
  else
    render :new
  end



  private
    def resume_params
      params.require(:resume).permit(:content)
    end
end
