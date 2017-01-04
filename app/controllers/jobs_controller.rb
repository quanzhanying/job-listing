class JobsController < ApplicationController
  before_action :authenticate_user! , only: [:new]
end
