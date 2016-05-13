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
    
      context 'with unordered array' do
        it 'return the correct value' do
          expect([5, 3, 2, 4, 1].binary_search(5)).to eql(4)
        end
      end

      context 'with array not having the value' do
        it 'return nil' do
          expect([3, 0, 9, 9, 3, 1, 6, 5, 5, 8, 5, 3, 6, 4, 8, 9, 0, 0, 4, 4, 6, 9, 9, 9, 5].binary_search(7)).to be_nil
        end
      end

      context 'with array without the value duplicates and greather than higher value' do
        it 'return nil' do
          expect([5, 1, 6, 6, 7, 5, 6, 1, 8, 7, 2, 2, 5, 3, 2, 5, 8, 4, 1, 3, 3, 5, 6, 6, 8].binary_search(9)).to be_nil
        end
      end

      context 'with array without the value duplicates and less than lower value' do
        it 'return nil' do
          expect([-9, -9, -8, -8, -7, -7, -6, -6, -5, -5, -3, -3, 0, 0, 0, 10, 10].binary_search(-10)).to be_nil
        end
      end


      context 'randomly generated array(s) with duplicates' do

        before do
          @array = Array.new(rand(100)) { rand(-10..10) }
          @item = rand(-10..10)
        end

        100.times do
          it 'return same value as index method' do
            puts "#{' '*6}Randomly generated #{@array.to_s} #{@item}"
            expect(@array.binary_search(@item)).to eql(@array.sort.index(@item))
          end
        end

      end

    end
  end
end
