class Admin::QuestionsController < ApplicationController
  load_and_authorize_resource

  before_action :load_subjects, except: [:index, :destroy]

  def index
    @q = Question.ransack params[:q]
    option = params[:option].nil? ? Settings.question.filter.all : params[:option]
    @questions = @q.result.includes(:subject).send(option).page(params[:page])
      .per Settings.pagination.questions_per_page
  end

  def create
    @question.user_id = current_user.id
    @question.status = Question.statuses[:accepted]
    if @question.save
      flash[:notice] = I18n.t "questions.created"
      redirect_to admin_questions_path
    else
      flash[:alert] = I18n.t "questions.create_fail"
      render :new
    end
  end

  def update
    if @question.update_attributes question_params
      flash[:notice] = I18n.t "questions.updated"
      redirect_to admin_questions_path
    else
      flash[:alert] = I18n.t "questions.update_fail"
      render :edit
    end
  end

  def destroy
    @question.destroy
    flash[:notice] = I18n.t "questions.destroyed"
    redirect_to admin_questions_path
  end

  private

  def question_params
    params.require(:question).permit(:subject_id, :question_type, :content, :status,
      options_attributes: [:id, :content, :is_correct, :_destroy])
  end

end
