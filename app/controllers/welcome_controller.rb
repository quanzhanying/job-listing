class WelcomeController < ApplicationController
	def index
		flash[:notice]="早安，好呀..."
	end
end
