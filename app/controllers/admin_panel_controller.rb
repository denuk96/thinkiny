class AdminPanelController < ApplicationController
  before_action :admin_verify

  def index
    @users = User.all
  end
end
