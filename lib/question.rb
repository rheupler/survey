class Question < ActiveRecord::Base
  belongs_to(:survey)
  has_many(:responses)
  has_many(:options)


  validates(:name, presence: true)
  before_save(:trim)
  before_save(:question_case)

private
  def trim
    self.name = self.name.strip
  end

  def question_case
    self.name = self.name.downcase
    self.name = self.name.capitalize
  end
end
