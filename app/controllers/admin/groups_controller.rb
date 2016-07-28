class Admin::GroupsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  before_filter :require_is_admin
  layout "admin"

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def show
    @group = Group.find(params[:id])

    if @group.is_hidden
      flash[:warning] = "This Job is already archived"
      redirect_to root_path
    end
  end

  def create
    @group = Group.new(group_params)

    if @group.save
      redirect_to admin_groups_path
    else
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to admin_groups_path
    else
      render :edit
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to admin_groups_path
  end

  def publish
    @group = Group.find(params[:id])
    @group.publish!
    redirect_to :back
  end

  def hide
    @group = Group.find(params[:id])
    @group.hide!
    redirect_to :back
  end



  private

  def require_is_admin
    if !current_user.admin?
      flash[:alert] = "You are not admin"
      redirect_to root_path
    end
  end

  def group_params
    params.require(:group).permit(:title, :description, :wage_upper_bound, :wage_lower_bound, :contact_email, :is_hidden)
  end
end
