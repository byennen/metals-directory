class Admin::ApplicationController < ActionController::Base

  layout 'admin'

  before_filter :authenticate_user!

  def authorize_admin
    authorize! :manage, :admin_pages
  end
end
