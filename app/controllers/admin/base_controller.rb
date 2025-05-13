class Admin::BaseController < ApplicationController
    before_action :authenticate_user!
    before_action -> { redirect_to root_path, alert: "権限がありません" unless current_user.admin? }
    layout "admin"
end
