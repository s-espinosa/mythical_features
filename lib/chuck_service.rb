require 'faraday'
require 'JSON'

class ChuckService
  def random
    response = conn.get do |req|
      req.url 'random'
    end
    JSON.parse(response.body)
  end

  def random_in_category(category)
    response = conn.get do |req|
      req.url 'random'
      req.params["category"] = category
    end
    JSON.parse(response.body)
  end

  def categories
    response = conn.get do |req|
      req.url 'categories'
    end
    JSON.parse(response.body)
  end

  def search(term)
    response = conn.get do |req|
      req.url 'search'
      req.params["query"] = term
    end
    JSON.parse(response.body)
  end

  private
  def conn
    @conn ||= Faraday.new(url: 'https://api.chucknorris.io/jokes/') do |faraday|
      faraday.adapter  Faraday.default_adapter
    end
  end
end
