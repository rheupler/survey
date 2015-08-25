require('spec_helper')

describe(Response) do

  before do
    @test_survey1 = Survey.create({name: "survey1"})
    @test_question = Question.create({name: "How are you?", survey_id: @test_survey1.id})
  end

  describe("#question") do
    it 'returns the question the response is to' do
      test_option = Option.create({name: "name", question_id: @test_question.id})
      test_response = Response.create({question_id: @test_question.id, option_id: test_option.id})
      expect(test_response.question()).to eq(@test_question)
    end
  end
  
end
