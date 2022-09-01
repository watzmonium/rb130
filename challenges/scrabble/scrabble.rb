
require 'pry'

class Scrabble
  attr_reader :word

  SCORES = { a: 1, b: 3, c: 3, d: 2, e: 1, f: 4, g: 2, h: 4, i: 1, 
             j: 8, k: 5, l: 1, m: 3, n: 1, o: 1, p: 3, q: 10, r: 1,
             s: 1, t: 1, u: 1, v: 4, w: 4, x: 8, y: 4, z: 10 }

  def initialize(word)
    @word = word
  end

  def score
    return 0 if word.nil?
    work_str = word.downcase.gsub(/[^a-z]/, '')
    #binding.pry
    sum = 0
    work_str.chars.each do |char|
      sum += SCORES[char.to_sym]
    end
    sum
  end

  def self.score(word)
    Scrabble.new(word).score
  end
end

=begin
Problem - 
  a class that computs the score of a scrabble word
  need a data structure for the score

examples
  assert_equal 6, Scrabble.new('street').score

data structures
  could use a hash of letters with values
  more work to set up but easy to work with

  could use a hash with keys that are arrays and search through those arrays for the right letter
  much slower lookup time and more complicated
=end
