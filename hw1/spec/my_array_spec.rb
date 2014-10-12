require 'rspec'
require_relative 'spec_helper'
require_relative '../my_array'

describe 'array hw' do
  shared_examples 'MyArray' do

    subject { MyArray.new(data) }

    it 'has a method for determining size' do
      ary = MyArray.new
      expect(ary.size).to eq 0
    end

    it 'copies data from an Array' do
      ary = MyArray.new([1, 2, 3])
      expect(ary.size).to eq 3
    end

    describe '#each' do
      subject(:data) { [2, 5, 3] }
      it { expect(data[0]).to eq 2 }
      it { expect(data[1]).to eq 5 }
      it { expect(data[2]).to eq 3 }

      it 'iterate over data' do
        d = []
        subject.each do |i|
          d << i
        end
        expect(d).to eq data
      end

      it 'works without passed block' do
        subject.each
      end

      it 'returns an Enumerator' do
        res = subject.each
        expect(res.class).to eq Enumerator
        expect(res.to_a).to eq data
      end

    end

    describe '#reverse' do
      let(:data) { [2, 5, 3] }
      let(:revdata) { [3, 5, 2] }

      it 'supports reverse_each' do
        expect(subject.reverse_each.to_a).to eq(revdata)
      end

      it 'works without passed block' do
        subject.reverse
      end

      it 'returns Array' do
        res = subject.reverse
        expect(res.class).to eq Array
        expect(res.to_a).to eq revdata
      end

      it 'support self-modifying reverse!' do
        subject.reverse!
        expect(subject.each.to_a).to eq([3, 5, 2])
      end
    end

    describe '#pop' do
      let(:data) { [2, 5, 3] }

      it 'have method pop' do
        subject.pop
      end

      it 'return the last element' do
        expect(subject.pop).to eq 3
      end

      it 'removes the last element' do
        expect { subject.pop }.to change { subject.size }.from(3).to(2)
      end
    end

    describe '#select' do
      let(:data) { [1, 2, 3, 4, 5, 6] }

      it 'selects even numbers' do
        res = subject.select(&:even?)
        expect(res).to eq [2, 4, 6]
      end
    end

    describe '#map' do
      describe 'strings' do
        let(:data) { %w( a b c d) }

        it 'iterates over elements and collect block results' do
          res = subject.map { |x| x << '!' }
          expect(res).to eq %w( a! b! c! d!)
        end

        it 'returns Enumerator' do
          res = subject.map
          expect(res.class).to eq Enumerator
        end
      end

      describe '#numbers' do
        let(:data) { [1, 2, 3, 4] }

        it 'does not modify original array' do
          res = subject.map { |x| x**2 }
          expect(res).to eq([1, 4, 9, 16])
          expect(subject.each.to_a).to eq([1, 2, 3, 4])
        end
      end
    end

    describe '#clear' do
      let(:data) { %w( a b c d) }

      it 'removes all elements' do
        expect { subject.clear }.to change { subject.size }.from(4).to(0)
      end
    end

    describe '#include?' do
      let(:data) { [2, 5, 15, 23] }

      it 'returns true if an element is in the array' do
        res = subject.include?(5)
        expect(res).to eq true
      end

      it 'returns false if an element is not in array' do
        res = subject.include?('duck')
        expect(res).to eq false
      end
    end

    describe '#max' do
      let(:data) { (1..50).to_a }

      it 'returns maximum value' do
        expect(subject.max).to eq 50
      end

      describe 'with block' do
        let(:data) { %w(dog horse albatross duck) }

        it 'compares length of strings' do
          res = subject.max { |a, b| a.length <=> b.length }
          expect(res).to eq 'albatross'
        end
      end
    end

  end

  describe MyArray do
    it_behaves_like 'MyArray'
  end

  describe Array do
    it_behaves_like 'MyArray'
  end
end
