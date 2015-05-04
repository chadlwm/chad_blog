class Admin::BaseController < ApplicationController
	before_action :authenticate_user!
	
  respond_to :html
  layout 'admin'
end
