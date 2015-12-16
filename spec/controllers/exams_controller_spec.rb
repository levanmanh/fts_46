require "rails_helper"

RSpec.describe ExamsController, type: :controller do
  let(:exam) {create :exam}
  let(:user) {create :user}
  let(:subject) {create :subject}

  before do
    sign_in user
    allow(controller).to receive(:current_user).and_return user
  end

  describe "GET index" do
    it "renders the index template" do
      get :index
      expect(assigns(:subjects)).to eq [subject]
      expect(assigns(:exam)).to be_a_new Exam
      # expect(assigns(:exams)).to eq [exam]
      expect(response).to render_template("exams/index")
      expect(response).to render_template("layouts/application")
    end
  end

  describe "GET show" do
    before {get :show, id: exam}
    it {expect(response).to render_template :show}
  end
end
