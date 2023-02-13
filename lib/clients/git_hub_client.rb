# frozen_string_literal: true

class GitHubClient
  ROOT_ENDPOINT = 'https://api.github.com/'
  ACCESS_TOKEN = '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'

  def initialize
    @http_client = setup_http_client
  end

  def creatre_gist(params)
    @http_client.post('gists') do |request|
      request.body = params.to_json
    end
  end

  private

  def setup_http_client
    Faraday.new(
      url: ROOT_ENDPOINT,
      headers: { 'Content-Type' => 'application/json', 'Authorization' => "token #{ACCESS_TOKEN}" }
    )
  end
end
