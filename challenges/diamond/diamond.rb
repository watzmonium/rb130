require 'pry'

class Diamond
  def self.make_diamond(letter)
    diamond_arr = let_arr(letter)
    cent = (2 * diamond_arr.size) - 1
    let_arr = print_top(diamond_arr, cent)
    let_arr += print_bot(diamond_arr[0...-1], cent)
    let_arr.join("\n") + "\n"
  end

  class << self
    private

    def let_arr(lets)
      ('A'..lets).to_a
    end

    def print_top(lets, cent)
      spaces = 1
      let_arr = []
      lets.each do |let|
        if let == 'A'
          let_arr << let.center(cent)
        else
          let_arr << "#{let}#{' ' * spaces}#{let}".center(cent)
          spaces += 2
        end
      end
      let_arr
    end

    def print_bot(lets, cent)
      spaces = 1 + (2 * (lets.size - 2))
      let_arr = []
      lets.reverse.each do |let|
        if let == 'A'
          let_arr << let.center(cent)
        else
          let_arr << "#{let}#{' ' * spaces}#{let}".center(cent)
          spaces -= 2
        end
      end
      let_arr
    end
  end
end

#puts Diamond.make_diamond('C')