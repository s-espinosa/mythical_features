require './spec/spec_helper'

describe AdviceService do
  before(:each) do
    @a = AdviceService.new
  end

  it 'exists' do
    expect(@a).to be_a(AdviceService)
  end

  it 'can find a random piece of advice' do
    random = @a.random

    expect(random["slip"]).to have_key("slip_id")
    expect(random["slip"]).to have_key("advice")
  end

  it 'can find a piece of advice by id' do
    advice = @a.find(2)

    expected = "Smile and the world smiles with you. Frown and you're on your own."
    actual   = advice["slip"]["advice"]

    expect(actual).to eq(expected)
  end

  it 'can find a piece of advice by id' do
    advice = @a.search("happiness")

    expect(advice).to have_key("total_results")
    expect(advice).to have_key("query")
    expect(advice).to have_key("slips")
    expect(advice["slips"][0]).to have_key("slip_id")
    expect(advice["slips"][0]).to have_key("advice")
  end
end
