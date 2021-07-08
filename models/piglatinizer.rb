# frozen_string_literal: true

class PigLatinizer
  VOWELS = %w[a e i o u].freeze
  TWO_LETTER_CONSONANTS = %w[bl br ch ck cl cr dr fl fr gh gl gr
                             ng ph pl pr qu sc sh sk sl sm sn sp
                             st sw th tr tw wh wr].freeze
  THREE_LETTER_CONSONANTS = %w[nth sch scr shr spl spr squ str thr].freeze

  def piglatinize(string)
    words = string.split(' ')
    words.map! { |word| convert(word) }
    words.join(' ')
  end

  def convert(word)
    chars = word.chars
    if VOWELS.include?(chars.first.downcase)
      word = chars << 'way'
    elsif THREE_LETTER_CONSONANTS.include?(chars[0..2].join.downcase)
      three_letter_consonant = chars.shift(3)
      word = chars << three_letter_consonant << 'ay'
    elsif TWO_LETTER_CONSONANTS.include?(chars[0..1].join.downcase)
      two_letter_consonant = chars.shift(2)
      word = chars << two_letter_consonant << 'ay'
    else
      first_letter = chars.shift
      word = chars << first_letter << 'ay'
    end
    word.join
  end
end
