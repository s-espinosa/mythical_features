require './spec/spec_helper'

describe DiscogsService do
  before(:each) do
    @d = DiscogsService.new
  end

  it 'exists' do
    expect(@d).to be_a(DiscogsService)
  end

  it 'can find a list of releases from an artist' do
    releases = @d.releases_from_artist("The Faces")

    expect(releases).to have_key("pagination")
    expect(releases).to have_key("results")
    expect(releases["results"].first).to have_key("title")
    expect(releases["results"].first).to have_key("id")
  end

  it 'can find a release rating' do
    rating = @d.release_rating(249504)

    expect(rating).to have_key("videos")
    expect(rating).to have_key("id")
    expect(rating).to have_key("year")
    expect(rating).to have_key("uri")
    expect(rating).to have_key("styles")
    expect(rating).to have_key("title")
  end
end
