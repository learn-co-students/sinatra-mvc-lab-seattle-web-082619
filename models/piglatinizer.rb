class PigLatinizer

  # def initalize
  #   @str = str.downcase
  # end

  def piglatinize(str)
    v = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]
    arr = str.split(" ")
    arr.map! do |w|
      if v.include?(w[0])
        w = w + "way"
      else
        arr2 = w.split("")
        i = 0
        while i < arr2.length do
          if v.include?(arr2[i])
            cons = w[0..i-1]
            break
          end
          i += 1
        end
        add = w.slice!(cons)
        w = w + add + "ay"
      end
    end
    arr.join(" ")
  end

end
