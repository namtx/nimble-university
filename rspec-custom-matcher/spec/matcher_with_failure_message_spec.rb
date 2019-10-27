RSpec::Matchers.define :be_a_multiple_of do |expected|
  match do |actual|
    actual % expected == 0
  end

  failure_message do |actual|
    "expected that #{actual} would be a multiple of #{expected}"
  end

  failure_message_when_negated do |actual|
    "expected that #{actual} would not be a multiple of #{expected}"
  end
end

describe 9 do
  it { is_expected.to be_a_multiple_of 4 }
end

describe 9 do
  it { is_expected.not_to be_a_multiple_of 3 }
end
