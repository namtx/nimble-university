module MyHelpers
  extend RSpec::Matchers::DSL

  matcher :be_just_like do |expected|
    match {| actual | actual == expected }
  end
end

describe 'group with MyHelpers' do
  include MyHelpers

  it 'has access to the defined matcher' do
    expect(5).to be_just_like 5
  end
end

describe 'group without MyHelpers' do
  it 'has no access to defined matcher' do
    expect do 
      5.to be_just_like 5
    end.to raise_error NoMethodError
  end
end
