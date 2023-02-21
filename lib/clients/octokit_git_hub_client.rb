# frozen_string_literal: true

class OctokitGitHubClient
  ROOT_ENDPOINT = 'https://api.github.com/'
  ACCESS_TOKEN = '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'

  def initialize
    @http_client = Octokit::Client.new(:access_token => ACCESS_TOKEN)
  end

  def create_gist(params)
    @http_client.post('gists') do |request|
      request.body = params.to_json
    end
  end
end
