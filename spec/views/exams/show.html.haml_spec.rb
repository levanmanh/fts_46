require "rails_helper"

RSpec.describe "exams/show.html.haml" do
  let!(:user) {create :user}
  let!(:subject) {create :subject}
  let!(:exam_finished) {create :exam, subject: subject, user: user}
  let!(:exam_testing) {create :exam, subject: subject,
    user: user, status: :testing}

  before do
    sign_in user
  end

  it "request to exams controller and show action" do
    expect(controller.request.path_parameters[:controller]).to eq "exams"
    expect(controller.request.path_parameters[:action]).to eq "show"
  end

  describe "exam is finished" do
    before do
      assign :exam, exam_finished
      render
    end
    it "renders the show template when exam finished" do
      expect(response).to render_template("exams/_exam_result")
      expect(response).to render_template("exams/show")
    end
    it "render field in exams list" do
      expect(rendered).to have_content exam_finished.subject.name
    end
  end

  describe "exam is testing" do
    before do
      assign :exam, exam_testing
      render
    end
    it "renders the show template" do
      expect(response).to render_template("exams/_exam")
      expect(response).to render_template("exams/show")
    end
    it "render field in exams list" do
      expect(rendered).to have_content exam_testing.subject.name
    end
    it "have input field save and finish" do
      expect(rendered).to have_selector "form" do |form|
        form.is_expected.to have_selector "input", value: "save"
        form.is_expected.to have_selector "input", value: "finish"
      end
    end
  end

end
