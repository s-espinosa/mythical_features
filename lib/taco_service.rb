require 'faraday'
require 'JSON'

class TacoService
  def random_ingredients
    response = conn.get do |req|
      req.url 'random/'
    end
    JSON.parse(response.body)
  end

  def random_taco
    response = conn.get do |req|
      req.url 'random/?full-taco=true'
    end
    JSON.parse(response.body)
  end

  def ingredients_by_type(type)
    response = conn.get do |req|
      req.url "/contributors/#{type}/"
    end
    JSON.parse(response.body)
  end

  def contributors_by_ingredient(type, ingredient)
    response = conn.get do |req|
      req.url "/contributors/#{type}/#{ingredient}/"
    end
    JSON.parse(response.body)
  end

  def contributors
    response = conn.get do |req|
      req.url '/contributions/'
    end
    JSON.parse(response.body)
  end

  def contributions(username)
    response = conn.get do |req|
      req.url "/contributions/#{username}/"
    end
    JSON.parse(response.body)
  end

  private
  def conn
    @conn ||= Faraday.new(url: 'http://taco-randomizer.herokuapp.com/') do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end
end
