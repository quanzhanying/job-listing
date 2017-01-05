class GroupsController < ApplicationController
  before_action :authenticate_admin! , only: [:new, :create, :edit, :update, :destroy]
  before_action :find_group_and_check_permission, only: [:edit, :update, :destroy]

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def show
    @group = Group.find(params[:id])
  end

  def edit
  end

  def create
    @group = Group.new(group_params)
    @group.admin = current_admin

    if @group.save
    redirect_to groups_path
  else
    render :new
  end
end

def update
    if @group.update(group_params)
      redirect_to groups_path, notice: "Update Success"
    else
      render :edit
    end
  end

  def destroy
    @group.destroy
    redirect_to groups_path, alert: "Group deleted"
  end


  private

  def find_group_and_check_permission
    @group = Group.find(params[:id])

    if current_admin != @group.admin
      redirect_to root_path, alert: "You have no permission."
    end
  end

  def group_params
    params.require(:group).permit(:title, :description)
  end

end
