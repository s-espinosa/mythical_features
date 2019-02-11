require 'faraday'
require 'JSON'

class StarWarsService
  def people(id)
    response = conn.get do |req|
      req.url "people/#{id}/"
    end
    JSON.parse(response.body)
  end

  private
  def conn
    @conn ||= Faraday.new(url: 'https://swapi.co/api/') do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end
end
