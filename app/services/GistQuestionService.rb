# frozen_string_literal: true

class GistQuestionService
  ACCESS_TOKEN = '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'

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(access_token: ACCESS_TOKEN)
  end

  def call
    @client.create_gist(gist_params.to_json)
  end

  private

  def gist_params
    {
      description: "A question about #{@test.title} from TestGuru",
      public: false,
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end
end
