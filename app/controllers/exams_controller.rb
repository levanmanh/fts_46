class ExamsController < ApplicationController
  def index
    @exam = Exam.new
    @subjects = Subject.all
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
end
