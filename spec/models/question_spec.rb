require "rails_helper"

RSpec.describe Question, type: :model do
  let!(:question_single){FactoryGirl.create :question_single}
  let!(:question_multi){FactoryGirl.create :question_multi}
  let!(:question_text){FactoryGirl.create :question_text}

  context "test single question" do
    it "content is blank" do
      expect(question_single).to be_valid
    end
    it "right type" do
      expect(question_single.question_type).to eq "single"
    end
  end

  context "test multi question" do
    it "content is blank" do
      expect(question_multi).to be_valid
    end
    it "right type" do
      expect(question_multi.question_type).to eq "multiple"
    end
  end

  context "test text question" do
    it "content is blank" do
      expect(question_text).to be_valid
    end
    it "right type" do
      expect(question_text.question_type).to eq "text"
    end
  end

  context "test association" do
    it {is_expected.to belong_to :user}
    it {is_expected.to belong_to :subject}
    it {is_expected.to have_many(:options).dependent(:destroy)}
    it {is_expected.to have_many(:exams).through :sections}
    it {is_expected.to have_many :sections}
  end

end
