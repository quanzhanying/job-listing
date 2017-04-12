class Admin::JobsController < ApplicationController
	before_action :authenticate_user!,  only: [:new, :create, :edit, :update, :destroy, :index]
	before_action :require_is_admin

	def index
		@jobs = Job.all	
	end

	def new
		@job = Job.find(params[:id])
	end

	def require_is_admin
		if current_user.email != 'wqy@163.com'
			flash[:alert] = 'You are not admin'
			redirect_to root_path
		end	
	end
end
