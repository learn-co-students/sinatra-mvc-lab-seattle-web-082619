class PigLatinizer
    attr_reader :text, :converted_text

    def initialize(text)
        @text = text.downcase.split(" ")
        @converted_text = convert()
    end

    def is_vowel?(char)  
        ['a','e','o','u','i'].include?(char)
    end
      
    def convert()
        new_word_arr = []
        @text.each do |word|
            new_word = ""
            append = ""
            word_arr = word.split('')
            word_arr.each_with_index do |char, index|
                if index == 0 && is_vowel?(char)
                    new_word = (word_arr << "way")
                    new_word = new_word.join()
                    break
                elsif index > 0 && is_vowel?(char)
                    new_word = (word_arr << ( append + "ay" ))
                    new_word = new_word.join()
                    break
                else 
                    append += char
                    word_arr[index] = ""
                end
            end
            new_word_arr << new_word
        end
        new_word_arr.join(" ")
    end

end