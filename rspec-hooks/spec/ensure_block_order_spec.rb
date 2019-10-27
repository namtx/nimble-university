RSpec.describe 'before and after callbacks' do
#  before :suite do
#    puts 'before ensure_block_order_spec suite'
#  end

  before :context do
    puts 'before context'
  end

  before :example do
    puts 'before context'
  end

  after :example do
    puts 'after example'
  end

  after :context do
    puts 'after context'
  end

  it 'gets run in order' do
  end
end
