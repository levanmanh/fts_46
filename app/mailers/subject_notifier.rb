class SubjectNotifier < ApplicationMailer
  default from: "any_from_address@example.com"

  def send_create_subject_email user, subject
    @user = user
    @subject = subject
    mail to: @user.email, subject: I18n.t("subject.titles.new")
  end
end
