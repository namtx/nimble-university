require 'rspec/expectations'

class Thing
  def widgets
    @widgets ||= []
  end
end

RSpec.describe Thing do 
#  before :suite do
#    puts 'before before_example_spec suite'
#  end
  
  before :example do
    @thing = Thing.new
  end

  describe 'initialized in before(:example)' do
    it 'has 0 widgets' do
      expect(@thing.widgets.count).to eq 0
    end

    it 'can accept new widget' do
      @thing.widgets << Object.new
    end

    it 'does not share state accross example' do
      expect(@thing.widgets.count).to eq 0
    end
  end
end
