class QuestionsController < ApplicationController
  before_action :load_subjects, except: [:index, :destroy]

  def index
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new question_params
    @question.user_id = current_user.id
    if @question.save
      redirect_to user_questions_path
    else
      render :new
    end
  end

  private

  def question_params
    params.require(:question).permit(:subject_id, :question_type, :content,
      options_attributes: [:id, :content, :is_correct, :_destroy])
  end

end
