class SubWordFinder

  @@word_length = 6
  attr_reader :words

  def load_file(file, options = {})
    @all_words = File.readlines(file, options).map {|w| w.strip}.reject { |w| w.empty? }
    @words = @all_words.select { |w| w.length == @@word_length }
    @sub_words = @all_words.select { |w| w.length < @@word_length }
    @sub_words_hash = {}
    @sub_words.each {|w| @sub_words_hash[w] ||= nil }
  end

  def find
    result = {}

    @words.each do |word|

      result[word] = []
      lbound = 0
      ubound = word.length - 1
      counter = 0

      while counter < ubound do
        part1 = word[lbound..(counter)]
        part2 = word[(counter + 1)..ubound]

        #puts "Working with #{part1}|#{part2}"
        if @sub_words_hash.include?(part1) && @sub_words_hash.include?(part2)
          #puts "There is a match for [#{word}] with [#{part1}] + [#{part2}]"
          result[word] << [part1, part2]
        end
        counter += 1

      end

    end

    result

  end

end