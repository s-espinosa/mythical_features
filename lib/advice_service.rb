require 'faraday'
require 'JSON'

class AdviceService
  def random
    response = conn.get do |req|
      req.url 'advice'
    end
    JSON.parse(response.body)
  end

  def find(id)
    response = conn.get do |req|
      req.url "advice/#{id}"
    end
    JSON.parse(response.body)

  end

  def search(term)
    response = conn.get do |req|
      req.url "advice/search/#{term}"
    end
    JSON.parse(response.body)
  end

  private
  def conn
    @conn ||= Faraday.new(url: 'https://api.adviceslip.com/') do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end
end
