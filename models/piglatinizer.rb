class PigLatinizer
    attr_reader :text

    def initialize(text)
        @text = text.downcase.split(" ")
    end

    def is_vowel?(str)
        str.include?(/[aeoui]/)
    end

    #Examples:
    # "noodle soup" becomes "oodlenay oupsay" 
    # "big apple" becomes "igbay appleway" (note the added "w" in "appleway")
    def convert()
        #.find(/[bcdfghjklmnpqrstvwxyz]/)
        # if first char == vowel
            # add 'way' to end of word
            #break
        # else
            #loop through word until you hit a vowel and chop off leading consonants, then append with 'ay'

        @text.each do |word|
            new_word = ""
            append = ""
            word.each do |char, index|
                if index == 0 && is_vowel?(char)
                    new_word = (word + "way")
                    break
                elsif index > 0 && is_vowel?(char)
                    new_word = (word + append + "ay" )
                else 
                    append += char
                    word[index] = ""
                end
            end


        end

    end
end