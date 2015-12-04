class Admin::UsersController < ApplicationController
  load_and_authorize_resource
  def index
    @users = User.page(params[:page])
      .per Settings.pagination.users_per_page
  end

  def show
    @q = @user.exams.ransack params[:q]
    option = params[:option].nil? ? Settings
      .admin.user.exam.all : params[:option]
    @exams = @q.result.send(option).page(params[:page])
      .per Settings.pagination.questions_per_page
  end
end
