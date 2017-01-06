class Admin::JobsController < ApplicationController
  before_filter :authenticate!, only: [:new, :create, :edit, :update, :destroy]
  before_filter :require_is_admin

  
end
