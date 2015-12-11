class ExamMailer < ApplicationMailer

  def exam_result exam
    @exam = exam
    @user = exam.user
    mail to: @user.email, subject: t("mail.exam_subject")
  end

  def notify_delay exam
    @exam = exam
    @user = exam.user
    mail to: @user.email, subject: t("mail.exam_delay")
  end

  def notify_when_end_of_month exam
    @exam = exam
    @user = exam.user
    mail to: @user.email, subject: t("mail.exam_result")
  end
end
