require "rails_helper"

RSpec.describe "exams/index.html.haml" do
  let!(:user) {create :user}
  let!(:subject) {create :subject}
  let!(:exam) {create :exam, subject: subject, user: user}
  let!(:exams) {user.exams.page(1)}

  before do
    sign_in user
    assign :subjects, Subject.all
    assign :exam, Exam.new
    assign :exams, exams
    render
  end
  it "request to exams controller and index action" do
    expect(controller.request.path_parameters[:controller]).to eq "exams"
    expect(controller.request.path_parameters[:action]).to eq "index"
  end

  it "render field in exams list" do
    expect(rendered).to have_content exam.subject.name
    expect(rendered).to have_content I18n.l exam.created_at, format: :define
    expect(rendered).to have_content exam.time_per_exam
    expect(rendered).to have_content exam.number_question
    expect(rendered).to have_content exam.real_time_spent
  end

  it "renders the index template" do
    expect(response).to render_template("exams/_status")
    expect(response).to render_template("exams/_score")
    expect(response).to render_template("exams/_continue")
    expect(response).to render_template("kaminari/_paginator")
    expect(response).to render_template("exams/index")
  end

  it "check input field" do
    expect(rendered).to have_selector "form" do |form|
      form.is_expected.to have_selector "input", name: "exam[subject_id]"
      form.is_expected.to have_selector "input", name: "commit"
    end
  end
end
