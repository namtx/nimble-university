require 'pty'

BIN = File.expand_path('../../bin/play', __FILE__)

puts BIN

RSpec.describe 'CLI' do
  it 'should work' do
    PTY.spawn(BIN) do |input, output, pid|
      sleep 0.5
      input.write('y\n')
      sleep 0.5

      buffer = output.read_nonblock(1024)

      raise unless buffer.include?("You won") || buffer.include?("You lost")
    end
  end
end
