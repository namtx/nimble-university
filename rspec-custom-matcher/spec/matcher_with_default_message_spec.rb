RSpec::Matchers.define :be_a_multiple_of do |expected|
  match do |actual|
    actual % expected == 0
  end
end

describe 9 do
  it {should be_a_multiple_of(3)}
end

describe 9 do
  it { is_expected.to be_a_multiple_of(4) }
end

describe 9 do
  it { is_expected.not_to be_a_multiple_of(4) }
end
