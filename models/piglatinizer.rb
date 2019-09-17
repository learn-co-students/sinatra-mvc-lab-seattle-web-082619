require 'pry'

class PigLatinizer

  attr_reader :text

  def initialize(text)
    @text = text
  end
  
  def piggie_it
    all_the_words = text.split(" ")
    vowels = ["a","e","i","o","u"]
    all_the_words.map do |word|
      consonant = ""
      if vowels.include?(word.slice(0))
        word << "w"
      end
      until vowels.include?(word.slice(0))
        consonant << word.slice!(0)
      end
      word << consonant << "ay"
    end
    all_the_words.join(" ")
  end
end
