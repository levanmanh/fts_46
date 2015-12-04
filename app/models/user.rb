class User < ActiveRecord::Base
  rolify
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
    :trackable, :validatable
  has_many :questions
  has_many :exams
end
