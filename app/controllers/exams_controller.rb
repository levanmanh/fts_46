class ExamsController < ApplicationController
  before_action :check_login

  def index
    @exam = Exam.new
    @subjects = Subject.all
    @exams = current_user.exams
  end

  def create
    @exam = Exam.new exam_params
    @exam.user_id = current_user.id
    if @exam.save
      flash[:notice] = I18n.t "exams.success"
      redirect_to exams_path
    else
      @subjects = Subject.all
      render :index
    end
  end

  private

  def exam_params
    params.require(:exam).permit :subject_id
  end

  def check_login
    if !user_signed_in?
      flash[:alert] = I18n.t "errors.messages.not_login"
      redirect_to new_user_session_path
    end
  end
end
