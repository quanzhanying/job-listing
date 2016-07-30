class ResumesController < ApplicationController


	def index
		@resumes = Resume.all
	end

	def show
		
	end

	def new
		
	end

	def create
		
	end

	def edit
		
	end

	def update
		
	end

	def destroy
		
	end

	private

	def get_params
		@resume = Resume.find(params[:id])
	end

	def resume_params
		
	end

end
