require 'faraday'
require 'JSON'
require 'digest'

class MarvelService
  def character(name)
    response = conn.get do |req|
      req.url 'characters'
      req.params['name'] = name
    end
    JSON.parse(response.body)
  end

  def creators(attributes)
    response = conn.get do |req|
      req.url 'creators'
      req.params['firstName'] = attributes[:first_name] if attributes[:first_name]
      req.params['lastName'] = attributes[:last_name] if attributes[:last_name]
    end
    JSON.parse(response.body)
  end

  private
  def conn
    td = time_digest
    @conn ||= Faraday.new(url: 'https://gateway.marvel.com:443/v1/public/') do |faraday|
      faraday.adapter Faraday.default_adapter
      faraday.params["apikey"] = ENV["MARVEL_KEY"]
      faraday.params["ts"]     = td["ts"]
      faraday.params["hash"]   = td["hash"]
    end
  end

  def time_digest
    ts     = Time.now.to_s
    secret = ENV["MARVEL_SECRET"]
    key    = ENV["MARVEL_KEY"]

    hash   = Digest::MD5.hexdigest(ts + secret + key)

    {"ts" => ts, "hash" => hash}
  end
end
