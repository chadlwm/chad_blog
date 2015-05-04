class Admin::DashboardController < Admin::BaseController
	authorize_object :dashboard
	
  def index
  end
end
