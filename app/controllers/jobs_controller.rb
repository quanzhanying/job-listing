class JobsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy, :follow, :unfollow]
  before_action :validate_search_key, only: [:search]
  def index
    jobs_ordered = case params[:order]
            when 'by_lower_bound'
              Job.published.order("wage_lower_bound DESC")
            when 'by_upper_bound'
              Job.published.order("wage_upper_bound DESC")
            else
              Job.published.recent
            end
    @jobs = jobs_ordered.paginate(:page => params[:page], :per_page => 5)
  end

  def show
    @job = Job.find(params[:id])

    if @job.is_hidden
      flash[:warning] = "This Job already archieved!"
      redirect_to jobs_path
    end

    if current_user.has_applied_for?(@job)
      flash[:notice] = "You have applied the Job!"
    end
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.create(job_params)

    if @job.save
      redirect_to jobs_path, notice: 'Job created'
    else
      render :new
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    @job.update(job_params)
    if @job.save
      redirect_to jobs_path, notice: 'Job updated'
    else
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy

    redirect_to jobs_path, alert: 'Job deleted'
  end

  def follow
    @job = Job.find(params[:id])
    current_user.follow!(@job)

    redirect_to :back, notice: "Follow the job!"
  end

  def unfollow
    @job = Job.find(params[:id])
    current_user.unfollow!(@job)

    flash[:warning] = "Stop follow the job!"
    redirect_to :back
  end

  def search
    if @query_string.present?
      search_result = Job.published.ransack(@search_criteria).result(:distinct => true)
      @jobs = search_result.paginate(:page => params[:page], :per_page => 5)
    end
  end

  protected
  def validate_search_key
    @query_string = params[:q].gsub(/\\|\'|\/|\?/, "")
    if params[:q].present?
      @search_criteria = search_criteria(@query_string)
    end
  end

  def search_criteria(query_string)
    { :title_cont => query_string }
  end

  private
  def job_params
    params.require(:job).permit(:title, :description, :wage_upper_bound, :wage_lower_bound, :contact_email, :is_hidden)
  end

end
