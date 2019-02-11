require 'faraday'
require 'JSON'

class MovieService
  def title(title)
    response = conn.get do |req|
      req.params["t"] = title
    end
    JSON.parse(response.body)
  end

  private
  def conn
    @conn ||= Faraday.new(url: 'http://www.omdbapi.com/?t=guardians%20of%20the%20galaxy%20vol.%202') do |faraday|
      faraday.adapter Faraday.default_adapter
      faraday.params["apikey"] = ENV["MOVIE_KEY"]
    end
  end
end
