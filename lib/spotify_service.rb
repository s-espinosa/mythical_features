require 'faraday'
require 'JSON'
require 'base64'

class SpotifyService
  def find_band(name)
    response = conn.get do |req|
      req.url 'search'
      req.params["q"] = name
      req.params["type"] = "artist"
    end
    JSON.parse(response.body)
  end

  private
  def conn
    @conn ||= Faraday.new(url: 'https://api.spotify.com/v1/') do |faraday|
      faraday.request  :url_encoded
      faraday.adapter Faraday.default_adapter
      faraday.headers["Authorization"] = "Bearer #{token}"
    end
  end

  def token
    @token_response ||= token_conn.post do |req|
      req.url 'token'
      req.headers['Authorization'] = "Basic #{auth_headers}"
      req.params["grant_type"] = "client_credentials"
    end
    JSON.parse(@token_response.body)["access_token"]
  end

  def token_conn
    @token_conn ||= Faraday.new(url: 'https://accounts.spotify.com/api/') do |faraday|
      faraday.request  :url_encoded
      faraday.adapter Faraday.default_adapter
    end
  end

  def auth_headers
    client_id     = ENV["SPOTIFY_ID"]
    client_secret = ENV["SPOTIFY_SECRET"]

    e = Base64.encode64("#{client_id}:#{client_secret}")
    e.delete("\n")
  end
end
