require 'spec_helper'

describe SubWordFinder do
  before(:all) do
    @subword_finder = SubWordFinder.new
    @data_dir = File.expand_path('../../data', __FILE__)
  end

  describe '.load_file'
    before { @subword_finder.load_file(File.join(@data_dir, 'fixtures1.txt')) }
    it 'open the file, load the words and return Array' do
      expect(@subword_finder.words).to be_an(Array)
  end
end