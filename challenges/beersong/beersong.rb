class BeerSong
  def self.verse(num)
    sing(num)
  end

  def self.verses(start, ending)
    ary = []
    start.downto(ending + 1) do |num|
      ary << sing(num)
    end
    ary.join("\n")
  end

  def self.lyrics
    self.verses(99, 0)
  end

  class << self
    private
  
    def sing(num)
      if num > 0
      "#{num} #{bot(num)} of beer on the wall, #{num} #{bot(num)} of beer.\n" \
      "Take #{one(num)} down and pass it around, #{no_more(num)} #{bot(num - 1)}" \
      " of beer on the wall.\n" \
      else
        "No more bottles of beer on the wall, no more bottles of beer.\n" \
        "Go to the store and buy some more, 99 bottles of beer on the wall.\n" \
      end
    end

    def bot(num)
      num == 1 ? 'bottle' : 'bottles'
    end

    def one(num)
      num == 1 ? 'it' : 'one'
    end

    def no_more(num)
      num == 1 ? 'no more' : num - 1
    end
  end
end

BeerSong.verses(99, 98)