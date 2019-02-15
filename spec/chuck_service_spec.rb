require 'spec_helper'

describe ChuckService do
  before(:each) do
    @c = ChuckService.new
  end
  it 'exists' do
    expect(@c).to be_a(ChuckService)
  end

  it 'can find a random Chuck Norris joke' do
    joke = @c.random

    expect(joke).to have_key("category")
    expect(joke).to have_key("icon_url")
    expect(joke).to have_key("id")
    expect(joke).to have_key("value")
  end

  it 'can find a random joke in a category' do
    joke = @c.random_in_category('music')

    expect(joke).to have_key("category")
    expect(joke).to have_key("icon_url")
    expect(joke).to have_key("id")
    expect(joke).to have_key("value")
  end

  it 'can find a list of all categories' do
    categories = @c.categories

    expect(categories).to include("music")
    expect(categories).to include("science")
    expect(categories).to include("fashion")
    expect(categories).to include("money")
    expect(categories).to include("career")
  end

  it 'can search for a joke' do
    search_results = @c.search("snakes")

    expect(search_results).to have_key("total")
    expect(search_results).to have_key("result")
    expect(search_results["result"][0]).to have_key("category")
    expect(search_results["result"][0]).to have_key("icon_url")
    expect(search_results["result"][0]).to have_key("id")
    expect(search_results["result"][0]).to have_key("value")
  end
end
