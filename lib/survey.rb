class Survey < ActiveRecord::Base
  has_many(:questions)

  validates(:name, presence: true)
  before_save(:trim)
  before_save(:title_case)

private
  def trim
    self.name = self.name.strip
  end

  def title_case
    arr = self.name.split(" ")
    arr.map do |word|
      word.downcase!
      word.capitalize!
    end
    self.name = arr.join(" ")
  end
end
