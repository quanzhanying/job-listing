module Admin::JobsHelper

  def isUserDashBoard
    if !params[:isUserDashBoard].blank?
      return params[:isUserDashBoard]
    else
      return false
    end

  end
end
