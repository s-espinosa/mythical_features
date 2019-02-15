require './spec/spec_helper'

describe TacoService do
  before(:each) do
    @t = TacoService.new
  end

  it 'exists' do
    expect(@t).to be_a(TacoService)
  end

  it 'can create a taco with random ingreients' do
    r = @t.random_ingredients

    expect(r).to have_key("mixin")
    expect(r).to have_key("seasoning")
    expect(r).to have_key("base_layer")
    expect(r).to have_key("condiment")
    expect(r).to have_key("shell")
  end

  it 'can find a random taco' do
    r = @t.random_taco

    expect(r).to have_key("condiment_url")
    expect(r).to have_key("seasoning_url")
    expect(r).to have_key("mixin_url")
    expect(r).to have_key("base_layer_url")
    expect(r).to have_key("base_layer_url")
    expect(r).to have_key("url")
    expect(r).to have_key("name")
    expect(r).to have_key("shell_url")
    expect(r).to have_key("recipe")
    expect(r).to have_key("slug")
  end

  it 'can find a list of contributors' do
    c = @t.contributors

    expect(c).to be_a(Array)
  end

  it 'can find contributions for a specific user' do
    c = @t.contributions("littlewhirl")

    expect(c).to have_key("full_name")
    expect(c).to have_key("username")
    expect(c).to have_key("shells")
    expect(c).to have_key("gravatar")
    expect(c).to have_key("condiments")
    expect(c).to have_key("mixins")
    expect(c).to have_key("base_layers")
    expect(c).to have_key("seasonings")
  end

  it 'can find ingredients of a specific type' do
    c = @t.ingredients_by_type("base_layers")

    expect(c).to be_a(Array)
    expect(c[0]).to have_key("name")
    expect(c[0]).to have_key("slug")
  end

  it 'can find contributors to a specific ingrdient' do
    c = @t.contributors_by_ingredient("base_layers", "boiled_ground_beef")

    expect(c).to be_a(Array)
    expect(c[0]).to have_key("gravatar")
    expect(c[0]).to have_key("username")
    expect(c[0]).to have_key("full_name")
  end
end

