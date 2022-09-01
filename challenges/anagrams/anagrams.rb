
class Anagram
  attr_reader :word

  def initialize(word)
    @word = word
  end

  def match(ary)
    ary = find_anagrams(ary)
    remove_dups(ary)
  end

  private

  def find_anagrams(ary)
    ary.select { |sub_word| sub_word.downcase.chars.sort == word.downcase.chars.sort }
  end

  def remove_dups(ary)
    seen_ary = [word.downcase]
    iterate_ary = ary.dup
    iterate_ary.each do |sub_word|
      if seen_ary.include?(sub_word.downcase)
        ary.delete(sub_word)
      else
        seen_ary << sub_word.downcase
      end
    end
    ary
  end
end
