class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  rolify
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
    :trackable, :validatable
  has_many :questions
  has_many :exams
end
