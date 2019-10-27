require 'set'
require 'card'

RSpec.describe Card, :unit do
  def card params = {}
    defaults = {
      suit: :hearts,
      rank: 7
    }

    Card.build(*defaults.merge(params).values_at(:suit, :rank))
  end

  it 'has a suit' do
    expect(card(suit: :spades).suit).to eq :spades
  end

  it 'has a rank' do
    expect(card(rank: 10).rank).to eq 10
  end

  context 'equality' do
    subject { card(suit: :spades, rank: 4) }

    describe 'comparing to itself' do
      let(:other) { card(suit: :spades, rank: 4) }

      it 'should equal' do
        expect(subject).to eq other
      end

      it 'should hash equal' do
        expect(Set.new([subject, other]).length).to eq 1
      end
    end


    shared_examples_for 'an unequal card' do
      it 'should unequal' do
        expect(subject).not_to eq other
      end

      it 'should not hash equal' do
        expect(Set.new([subject, other]).length).to eq 2
      end
    end

    describe 'compring to a differing of rank' do
      let(:other) { card(rank: 5) }

      it_behaves_like 'an unequal card' 
    end

    describe 'comparing to a differing of suit' do
      let(:other) { card(suit: :hearts) }

      it_behaves_like 'an unequal card' 
    end
  end
end

