require('spec_helper')

describe(Survey) do
  it('has questions in the survey') do
    test_survey1 = Survey.create({name: "survey1"})
    test_question = Question.create({name: "How are you?", survey_id: test_survey1.id})
    expect(test_survey1.questions()).to eq([test_question])
  end
end
