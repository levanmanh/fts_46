require "rails_helper"

RSpec.describe Exam, type: :model do

  subject {build :exam}

  it {is_expected.to respond_to :subject_id}
  it {is_expected.to respond_to :user_id}
  it {is_expected.to respond_to :status}

  context "subject_id attribute" do
    it {expect(subject.subject_id).to_not be_nil}
  end

  context "user_id attribute" do
    it {expect(subject.user_id).to_not be_nil}
  end

  context "status attribute" do
    it {expect(subject.status).to_not be_nil}
  end

  describe "association" do
    it {should have_many(:sections)}
    it {should have_many(:questions).through(:sections)}
    it {should belong_to(:subject)}
    it {should belong_to(:user)}
  end

  describe "accept nested attributes for" do
    it{should accept_nested_attributes_for(:sections)}
  end

  describe "accept nested attributes for" do
    it{should accept_nested_attributes_for(:questions)}
  end
end
