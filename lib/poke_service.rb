require 'faraday'
require 'JSON'

class PokeService
  def pokemon(name)
    response = conn.get do |req|
      req.url "pokemon/#{name}"
    end
    JSON.parse(response.body)
  end

  private
  def conn
    @conn ||= Faraday.new(url: 'https://pokeapi.co/api/v2/') do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end
end
