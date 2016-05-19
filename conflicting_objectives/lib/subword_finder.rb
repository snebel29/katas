class SubWordFinder

  attr_reader :words
  def load_file(file, options = {})
    @words = File.readlines(file, options) { |w| w.chomp }
    puts @words
  end

end