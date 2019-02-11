require 'faraday'
require 'JSON'

class MessageService
  def random
    response = conn.get do |req|
      req.url 'advice'
    end
    JSON.parse(response.body)
  end

  private
  def conn
    @conn ||= Faraday.new(url: 'https://api.adviceslip.com/') do
      faraday.adapter Faraday.default_adapter
    end
  end
end
