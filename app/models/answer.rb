class Answer < ActiveRecord::Base
  belongs_to :section
  belongs_to :option
end
