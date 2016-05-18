# encoding: utf-8
require 'spec_helper'

describe Anagrams do
  before(:all) do
    @anagrams = Anagrams.new
    @data_dir = File.join(File.expand_path('../../data', __FILE__))
  end

  describe '.find' do
    context 'with 2 valid values' do
      before do
        @file = File.join(@data_dir, 'fixtures1.txt')
        @anagrams.load_file(@file)
      end
      it { expect(@anagrams.find.length).to eq(1) }
      it 'expect to have both words' do
        expect(@anagrams.find[["h", "i", "i", "k", "n", "p", "s"]]).to eq(["kinship", "pinkish"])
      end
    end

    context 'without loading a file' do
      it {
        expect {
          raise LoadFileError.new('A word file should be loaded using load_file method')
        }.to raise_error(LoadFileError)
      }
    end

    context 'with a full word list in iso-8859 codification' do
      before do
        @file = File.join(File.expand_path('../../data', __FILE__), 'wordlist.txt')
        @anagrams.load_file(@file, :encode => 'iso-8859-1')
      end

      it { expect(@anagrams.find.length).to eq(20683)}
      it 'expect to have some random anagrams' do
        expect(@anagrams.find[["a", "e", "n", "o", "r", "s", "s", "u"]]).to eq(["anserous", "arsenous"])
      end
    end

    context 'with a full word list find all anagrams' do

    end

  end

end