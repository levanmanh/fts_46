class ExamsController < ApplicationController
  load_resource
  def index
    @exam = Exam.new
    @subjects = Subject.all
    @exams = current_user.exams.page(params[:page]).per 20
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

  def show
    @exam.change_status_when_test
  end

  def update
    @exam.recalculate_time
    @exam.status = :checking if params[:commit] == "finish"
    @exam.status= :saved if params[:commit] == "save"
    if @exam.update_attributes exam_params
      redirect_to exams_path
    else
      render :edit
    end
  end

  private

  def exam_params
    params.require(:exam).permit :subject_id,
      sections_attributes: [:id, :answer, answer: []]
  end
end
