require 'spec_helper'

describe SubWordFinder do
  before(:all) do
    @subword_finder = SubWordFinder.new
    @data_dir = File.expand_path('../../data', __FILE__)
  end

  describe '.load_file' do
    before(:all) { @subword_finder.load_file(File.join(@data_dir, 'fixtures1.txt')) }
    it 'open the file, load the words and return Array' do
      expect(@subword_finder.words).to be_an(Array)
    end
  end

  describe '.find' do
    before(:all) do
      @subword_finder.load_file(File.join(@data_dir, 'fixtures1.txt'))
      @results = @subword_finder.find
    end

    context 'with a file loaded find words and return hash' do
      it { expect(@results).to be_an(Hash) }
    end

    context 'with fixtures1 loaded' do
      it 'find correct results' do
        expect(@results).to eql({"albums"=>[["al", "bums"]], "barely"=>[["bar", "ely"]], "befoul"=>[["be", "foul"]], "convex"=>[["con", "vex"]], "hereby"=>[["here", "by"]], "jigsaw"=>[["jig", "saw"]], "tailor"=>[["tail", "or"]], "weaver"=>[["we", "aver"]], "letter"=>[], "albert"=>[]})
      end
    end

    describe '.find' do
      before(:all) do
        @subword_finder.load_file(File.join(@data_dir, 'fixtures2.txt'))
        @results = @subword_finder.find
      end

      context 'with a file loaded find words and return hash' do
        it { expect(@results).to be_an(Hash) }
      end

      context 'with fixtures1 loaded' do
        it 'find correct number of results = 56674' do
          expect(@results.flatten.length).to eql(56674)
        end
      end

    end

  end

end