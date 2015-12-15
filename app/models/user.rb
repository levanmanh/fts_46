class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  rolify
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
    :trackable, :validatable
  has_many :questions
  has_many :exams
  has_many :activities

  validates :name, presence: true, length: {maximum: 100}
end
