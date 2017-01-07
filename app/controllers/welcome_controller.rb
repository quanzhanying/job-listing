class WelcomeController < ApplicationController
	def index
		flash[:alert]="早上好！"
	end
end
