require "rails_helper"
require "cancan/matchers"
require "rolify/matchers"

describe User, type: :model do
  let!(:user1){FactoryGirl.create :user}
  let!(:user2){FactoryGirl.build :user}

  it{is_expected.to respond_to :name}
  it{is_expected.to respond_to :email}
  it{is_expected.to respond_to :password}
  it{is_expected.to respond_to :password_confirmation}

  context "invalid input" do
    it "name is blank" do
      user1.name = ""
      expect(user1).to_not be_valid
    end

    it "name has length > 100" do
      user1.name = "a"*101
      expect(user1).to_not be_valid
    end

    it "email is blank" do
      user1.email = ""
      expect(user1).to_not be_valid
    end

    it "email is duplicate" do
      expect{
        user2.email = user1.email
        user2.save
      }.to change{User.count}.by 0
    end

    it "password is blank" do
      user1.password = ""
      expect(user1).to_not be_valid
    end

    it "password has length < 8" do
      user1.password = "1234567"
      expect(user1).to_not be_valid
    end

    it "password_confirmation is blank" do
      user1.password_confirmation = ""
      expect(user1).to_not be_valid
    end

    it "password_confirmation not math" do
      user1.password_confirmation = "12332112"
      expect(user1).to_not be_valid
    end
  end

  describe "admin abilities" do
    subject(:ability){Ability.new admin}

    context "when user is an admin" do
      let(:admin){FactoryGirl.create(:admin)}

      it{should be_able_to(:manage, Subject)}
      it{should be_able_to(:manage, User)}
      it{should be_able_to(:manage, Question)}
      it{should be_able_to(:manage, Exam)}
    end
  end

  describe "member abilities" do
    subject(:ability){Ability.new member}

    context "When user is a member" do
      let(:member){FactoryGirl.create(:user)}

      it{should_not be_able_to(:destroy, User.new)}
      it{should_not be_able_to(:destroy, Exam)}

      it{should be_able_to(:manage, Question, member.id)}
      it{should be_able_to(:manage, Exam, member.id)}
    end
  end
end
