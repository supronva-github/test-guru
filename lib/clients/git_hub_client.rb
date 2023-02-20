# frozen_string_literal: true

class GitHubClient
  ROOT_ENDPOINT = 'https://api.github.com/'
  ACCESS_TOKEN = 'example'

  def initialize
    @http_client = setup_http_client
  end

  def create_gist(params)
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
