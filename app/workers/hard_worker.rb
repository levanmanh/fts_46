class HardWorker
  include Sidekiq::Worker
  def perform exam_id
    exam = Exam.find exam_id
    ExamMailer.exam_result(exam).deliver_now
  end
end
