require 'spec_helper'

describe Array do
  describe 'returns the index of an item within an array' do

    describe '#binary_search' do
      context 'with an empty array' do
        it 'return nil' do
          expect([].binary_search(1)).to be_nil
        end
      end

      context 'with a single matching element array' do
        it 'return 0' do
          expect([1].binary_search(1)).to eql(0)
        end
      end

      context 'with a five elements array' do
        it 'return 4' do
          expect([1, 2, 3, 4, 5].binary_search(5)).to eql(4)
        end
      end

    end
  end
end
