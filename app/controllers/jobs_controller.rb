class JobsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy, :join, :quit, :perjobs]
  before_action :find_job_and_check_permission, only: [:edit, :update, :destroy]
  before_action :validate_search_key, only: [:search]

# ---CRUD---

  def index
    @jobs = case params[:order]
    when 'by_lower_bound'
      Job.published.order('wage_lower_bound DESC').paginate(:page => params[:page], :per_page => 10)
    when 'by_upper_bound'
      Job.published.order('wage_upper_bound DESC').paginate(:page => params[:page], :per_page => 10)
    else
      Job.published.recent.paginate(:page => params[:page], :per_page => 10)
    end
  end

  def new
    @job = Job.new
  end

  def show
    @job = Job.find(params[:id])

    if @job.is_hidden
      flash[:warning] = "这个职位已归档！不可查看！"
      redirect_to root_path
    end
  end

  def create
    @job = Job.new(job_params)
    @job.user = current_user
    if @job.save
      redirect_to perjobs_jobs_path, notice: "新建职位成功！待管理员审核后将公开发布！"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @job.update(job_params)
      redirect_to perjobs_jobs_path, notice: "更新职位成功！"
    else
      render :edit
    end
  end

  def destroy
    @job.destroy
    redirect_to perjobs_jobs_path, notice: "删除职位成功！"
  end

  def admin
  end


# --个人发布职位--

  def perjobs
    @jobs = current_user.jobs
  end


  # --个人投递职位--

  def perresumes
    @post_jobs = current_user.post_jobs
    @collect_jobs = current_user.participated_jobs

  end

# --category--

  def steel
    @jobs = case params[:order]
    when 'by_lower_bound'
      Job.published.where(:category => "铁匠").order('wage_lower_bound DESC').paginate(:page => params[:page], per_page => 10)
    when 'by_upper_bound'
      Job.published.where(:category => "铁匠").order('wage_upper_bound DESC').paginate(:page => params[:page], per_page => 10)
    else
      Job.published.where(:category => "铁匠").recent.paginate(:page => params[:page], :per_page => 10)
    end
  end

  def wood
    @jobs = case params[:order]
    when 'by_lower_bound'
      Job.published.where(:category => "木匠").order('wage_lower_bound DESC').paginate(:page => params[:page], per_page => 10)
    when 'by_upper_bound'
      Job.published.where(:category => "木匠").order('wage_upper_bound DESC').paginate(:page => params[:page], per_page => 10)
    else
      Job.published.where(:category => "木匠").recent.paginate(:page => params[:page], :per_page => 10)
    end
  end

  def stone
    @jobs = case params[:order]
    when 'by_lower_bound'
      Job.published.where(:category => "石匠").order('wage_lower_bound DESC').paginate(:page => params[:page], per_page => 10)
    when 'by_upper_bound'
      Job.published.where(:category => "石匠").order('wage_upper_bound DESC').paginate(:page => params[:page], per_page => 10)
    else
      Job.published.where(:category => "石匠").recent.paginate(:page => params[:page], :per_page => 10)
    end
  end



# --collect--

  def join
    @job = Job.find(params[:id])

    if !current_user.is_member_of?(@job)
      current_user.join_collect!(@job)
    end

    redirect_to job_path(@job)
  end

  def quit
    @job = Job.find(params[:id])

    if current_user.is_member_of?(@job)
      current_user.quit_collect!(@job)
    end

    redirect_to job_path(@job)
  end


# --search--

  def search
    if @query_string.present?
      search_result = Job.published.ransack(@search_criteria).result(:distinct => true)
      @jobs = search_result.paginate(:page => params[:page], :per_page => 10 )
    end
  end

  protected

  def validate_search_key
    @query_string = params[:q].gsub(/\\|\'|\/|\?/, "")
    if params[:q].present?
      @search_criteria = {
        title_or_description_or_category_or_company_or_city_cont: @query_string
      }
    end
  end


  def search_criteria(query_string)
    { :title_cont => query_string }
  end



# --private--

  private

  def find_job_and_check_permission
    @job = Job.find(params[:id])

    if current_user != @job.user
      redirect_to perjobs_jobs_path, alert: "你没有权限修改！"
    end
  end

  def job_params
    params.require(:job).permit(:title, :description, :wage_lower_bound, :wage_upper_bound, :contact_email, :is_hidden, :category, :company, :city)
  end


end
