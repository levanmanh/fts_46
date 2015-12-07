class Admin::ExamsController < ApplicationController
  load_and_authorize_resource
  def index
    @q = Exam.ransack params[:q]
    option = params[:option].nil? ? Settings.exam.filter.all : params[:option]
    @exams = @q.result.includes(:subject).send(option).page(params[:page])
      .per Settings.pagination.questions_per_page
  end

  def update
    @exam.status = :checked
    if @exam.update_attributes exam_params
      flash[:notice] = I18n.t "exam.checked"
      redirect_to admin_exams_path
     else
      flash[:alert] = I18n.t "exam.update_fail"
      render :edit
    end
  end

  def destroy
    @exam.destroy
    flash[:notice] = I18n.t "exam.destroyed"
    redirect_to admin_exams_path
  end

  private

  def exam_params
    params.require(:exam).permit :subject_id,
    sections_attributes: [:id, :result, answer: []]
  end
end
