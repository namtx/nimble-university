class ExpectationTarget
  def initialize(actual)
    @actual = actual
  end

  def to(matcher)
    matcher.call(@actual)
  end
end

class EqMatcher

  def initialize(expected)
    @expected = expected
  end

  def call actual
    if actual != @expected
      raise "Expected #{@expected}, got #{actual}"
    end 
  end
end

# helper
def expect actual
  ExpectationTarget.new actual
end

def eq expected
  EqMatcher.new expected
end

expect(1).to eq 2

