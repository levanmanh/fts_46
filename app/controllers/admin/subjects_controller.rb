class Admin::SubjectsController < ApplicationController
  load_and_authorize_resource
  def index
    @subjects = Subject.page(params[:page])
      .per Settings.pagination.subjects_per_page
  end

  def create
    if @subject.save
      SubjectNotificationService.new(@subject).mail_to_user_when_create
      flash[:notice] = I18n.t "subject.flash.created"
      redirect_to admin_subjects_path
    else
      flash[:alert] = I18n.t "subject.flash.create_fail"
      render :new
    end
  end

  def update
    if @subject.update_attributes subject_params
      flash[:notice] = I18n.t "subject.flash.updated"
      redirect_to admin_subjects_path
    else
      flash[:alert] = I18n.t "subject.flash.update_fail"
      render :edit
    end
  end

  def destroy
    @subject.destroy
    flash[:notice] = I18n.t "subject.flash.destroyed"
    redirect_to admin_subjects_path
  end

  private

  def subject_params
    params.require(:subject).permit :name
  end

end
