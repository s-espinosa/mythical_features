require 'faraday'
require 'JSON'

class DiscogsService
  def releases_from_artist(name)
    response = conn.get do |req|
      req.url 'search'
      req.params["artist"] = name
      req.params["country"] = "us"
    end
    JSON.parse(response.body)
  end

  def release_rating(album_id)
    response = conn.get do |req|
      req.url "/releases/#{album_id}"
    end
    JSON.parse(response.body)
  end

  private
  def conn
    @conn ||= Faraday.new(url: 'https://api.discogs.com/database') do |faraday|
      faraday.adapter Faraday.default_adapter
      faraday.params["key"]    = ENV["DISCOGS_KEY"]
      faraday.params["secret"] = ENV["DISCOGS_SECRET"]
    end
  end
end
