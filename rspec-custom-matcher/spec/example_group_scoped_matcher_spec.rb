describe 'group with matcher' do
  matcher :be_just_like do |expected|
    match do |actual|
      expected == actual
    end
  end

  it 'has access to the defined matcher' do
    expect(5).to be_just_like 5
  end
end

describe 'group without matcher' do
  it 'has no access to the defined matcher' do
    expect do
      5.to be_just_like 5
    end.to raise_error NoMethodError
  end
end
