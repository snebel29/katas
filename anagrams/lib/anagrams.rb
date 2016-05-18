# encoding: utf-8
class LoadFileError < StandardError; end

class Anagrams

  def load_file(file, options = {})
    @words = File.readlines(file, options).map { |w| w.chomp.encode('utf-8') }
  end

  def find
    raise 'File has to be loaded before being able to search' if @words.nil?
    anagrams = {}

    buffer = @words.each_with_object(Hash.new []) do |word, hash|
      hash[word.chars.sort] += [word]
    end

    @words.each do |word|
      id = word.chars.sort
      anagram_group = buffer[id]
      #puts anagram_group.to_s
      anagrams[id] = anagram_group if anagram_group.count > 1
    end

    anagrams

  end

end