require 'faraday'
require 'JSON'

class WesterosService
  def book(id)
    response = conn.get do |req|
      req.url "books/#{id}"
    end
    JSON.parse(response.body)
  end

  def character(id)
    response = conn.get do |req|
      req.url "characters/#{id}"
    end
    JSON.parse(response.body)
  end

  private
  def conn
    @conn ||= Faraday.new(url: 'https://www.anapioficeandfire.com/api/') do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end
end
