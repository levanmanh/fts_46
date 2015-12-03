class Admin::QuestionsController < ApplicationController
  before_action :load_subjects, except: [:index, :destroy]

  def index
    @questions = current_user.questions.order("content")
      .page(params[:page]).per(5)
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new question_params
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

  def show
    @question = Question.find params[:id]
  end

  def edit
    @question = Question.find params[:id]
  end

  def update
    @question = Question.find params[:id]
    if @question.update_attributes question_params
      flash[:notice] = I18n.t "questions.updated"
      redirect_to admin_questions_path
    else
      flash[:alert] = I18n.t "questions.update_fail"
      render :edit
    end
  end

  def destroy
    Question.find(params[:id]).destroy
    flash[:notice] = I18n.t "questions.destroyed"
    redirect_to admin_questions_path
  end

  private

  def question_params
    params.require(:question).permit(:subject_id, :question_type, :content,
      options_attributes: [:id, :content, :is_correct, :_destroy])
  end

end
