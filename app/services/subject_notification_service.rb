class SubjectNotificationService
  def initialize subject
    @user = User.all
    @subject = subject
  end

  def mail_to_user_when_create
    @user.each do |user|
      SubjectNotifier.send_create_subject_email(user, @subject).deliver_now
    end
  end

end

