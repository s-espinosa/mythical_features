require './lib/chuck_service'

class Joke
  def self.random
    joke = chuck_service.random
    Joke.new(joke)
  end

  def self.random_in_category(category)
    joke = chuck_service.random_in_category(category)
    Joke.new(joke)
  end

  def self.categories
    chuck_service.categories
  end

  def self.search(term)
    jokes = chuck_service.search(term)["result"]
    jokes.map do |joke|
      Joke.new(joke)
    end
  end

  attr_reader :category,
              :icon_url,
              :id,
              :url,
              :value

  def initialize(args)
    @category = args["category"]
    @icon_url = args["icon_url"]
    @id       = args["id"]
    @url      = args["url"]
    @value    = args["value"]
  end


  private

  def chuck_service
    @service ||= ChuckService.new
  end
end

