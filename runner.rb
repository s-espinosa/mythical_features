require './lib/chuck_service'
require './lib/joke'
require './lib/poke_service'
require './lib/advice_service'
require './lib/star_wars_service'
require './lib/westeros_service'
require './lib/movie_service'
require './lib/lyrics_service'
require './lib/discogs_service'
require './lib/translation_service'
require './lib/taco_service'
require './lib/marvel_service'
require './lib/spotify_service'
require './lib/language_service'
require './lib/message_service'
require './lib/voice_service'
require 'dotenv'
Dotenv.load

c    = ChuckService.new
p    = PokeService.new
a    = AdviceService.new
sw   = StarWarsService.new
w    = WesterosService.new
m    = MovieService.new
l    = LyricsService.new
d    = DiscogsService.new
t    = TranslationService.new
taco = TacoService.new
marv = MarvelService.new
s    = SpotifyService.new
lang = LanguageService.new
mess = MessageService.new
v    = VoiceService.new

require 'pry'; binding.pry
