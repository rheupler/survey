require('spec_helper')

describe(Question) do

  before do
    @test_survey1 = Survey.create({name: "survey1"})
    @test_question = Question.create({name: "How are you?", survey_id: @test_survey1.id})
  end

  it('has one survey') do
    expect(@test_question.survey).to eq(@test_survey1)
  end
  
  it('has many options') do
    test_option1= Option.create(name: "red", question_id: @test_question.id)
    test_option2= Option.create(name: "blue", question_id: @test_question.id)
    expect(@test_question.options).to eq([test_option1, test_option2])
  end
end
