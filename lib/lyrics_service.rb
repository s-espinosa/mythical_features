require 'faraday'
require 'JSON'

class LyricsService
  def find_artist(name)
    response = conn.get do |req|
      req.url 'artist.search'
      req.params["q_artist"] = name
    end
    JSON.parse(response.body)
  end

  def albums_by(artist_name)
    artist_id = get_artist_id(artist_name)
    response = conn.get do |req|
      req.url 'artist.albums.get'
      req.params["artist_id"] = artist_id
    end
    JSON.parse(response.body)
  end

  private
  def conn
    @conn ||= Faraday.new(url: 'https://api.musixmatch.com/ws/1.1/') do |faraday|
      faraday.adapter Faraday.default_adapter
      faraday.params["apikey"] = ENV["MUSIC_KEY"]
    end
  end

  def get_artist_id(artist_name)
    find_artist(artist_name)["message"]["body"]["artist_list"].first["artist"]["artist_id"]
  end
end
