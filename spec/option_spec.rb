require('spec_helper')

describe(Option) do

  before do
    @test_survey1 = Survey.create({name: "survey1"})
    @test_question = Question.create({name: "How are you?", survey_id: @test_survey1.id})
    @test_option1= Option.create(name: "red", question_id: @test_question.id)
  end

  it('has one question') do
    expect(@test_option1.question).to eq(@test_question)
  end
end
