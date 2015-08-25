class Question < ActiveRecord::Base
  belongs_to(:survey)
  has_many(:responses)
  has_many(:options)
end
