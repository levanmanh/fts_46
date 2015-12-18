require "rails_helper"

RSpec.describe QuestionsController, type: :controller do
  let!(:user) {create :user}
  let!(:question) {create :question, user: user}
  let!(:question_fail) {create :question_fail}

  before do
    sign_in user
    allow(controller).to receive(:current_user).and_return user
  end

  describe "can GET #index" do
    it "render index success" do
      get :index , user_id: user.id
      expect(assigns(:questions)).to eq user.questions.order("content")
      expect(response).to render_template("questions/index")
      expect(response).to render_template("layouts/application")
    end
  end

  describe "can GET #new" do
    it "render new success" do
      get :new , user_id: user.id
      expect(assigns(:question)).to be_a_new Question
      expect(response).to render_template("questions/new")
      expect(response).to render_template("layouts/application")
    end
  end

  describe "can POST #create" do
    it "create success" do
      post :create, user_id: user.id, question: attributes_for(:question)
      expect(assigns(:question).save).to be_truthy
      expect(response.redirect?).to be_truthy
      expect(flash[:notice]).to be_present
    end
    it "create not success" do
      post :create, user_id: user.id, question: attributes_for(:question_fail)
      expect(question_fail.content).to eq nil
    end
  end

  describe "can GET #show" do
    it "render new success" do
      get :show , user_id: user.id, id: question.id
      expect(assigns(:question)).to eq question
      expect(response).to render_template("questions/show")
      expect(response).to render_template("layouts/application")
    end
  end

  describe "can GET #edit" do
    it "render edit success" do
      get :edit , user_id: user.id, id: question.id
      expect(assigns(:question)).to eq question
      expect(response).to render_template("questions/edit")
      expect(response).to render_template("layouts/application")
    end
  end

  describe "can PATCH #update" do
    it "update success" do
      patch :update , user_id: user.id, id: question.id,
        question: attributes_for(:question)
      expect(assigns(:question).save).to be_truthy
      expect(response.redirect?).to be_truthy
      expect(flash[:notice]).to be_present
    end
  end

  describe "can DELETE #destroy" do
    it "delete success" do
      delete :destroy , user_id: user.id, id: question.id,
        question: attributes_for(:question)
      expect(assigns(:question).save).to be_truthy
      expect(response.redirect?).to be_truthy
      expect(flash[:notice]).to be_present
    end
    it "delete success" do
      delete :destroy , user_id: user.id, id: question.id,
        question: attributes_for(:question)
      expect(assigns(:question).destroy).to be_truthy
      expect(response.redirect?).to be_truthy
      expect(flash[:notice]).to be_present
    end
  end
end
