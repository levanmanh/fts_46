class QuestionsController < ApplicationController
  load_and_authorize_resource
  before_action :load_subjects, except: [:index, :destroy]

  def index
    @user = User.friendly.find(params[:user_id])
    @questions = @user.questions.order("content")
      .page(params[:page]).per(5)
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new question_params
    @question.user_id = current_user.id
    if @question.save
      flash[:notice] = I18n.t "questions.created"
      redirect_to user_questions_path current_user
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
      redirect_to user_questions_path
    else
      flash[:alert] = I18n.t "questions.update_fail"
      render :edit
    end
  end

  def destroy
    Question.find(params[:id]).destroy
    redirect_to user_questions_path(current_user)
    flash[:notice] = I18n.t "questions.destroyed"
  end

  private

  def question_params
    params.require(:question).permit(:subject_id, :question_type, :content,
      options_attributes: [:id, :content, :is_correct, :_destroy])
  end

end
