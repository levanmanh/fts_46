class Activity < ActiveRecord::Base
  enum action: [:login, :logout]

  belongs_to :user

  def self.add_activity action, user_id
    Activity.create action: action, user_id: user_id
  end
end
