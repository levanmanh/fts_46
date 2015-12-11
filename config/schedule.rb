every "0 0 1 * *" do
  rake "exams:notify_when_end_of_month"
end
