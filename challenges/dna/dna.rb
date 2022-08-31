class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(other_strand)
    difference_count = 0
    other_strand.chars.each_with_index do |base, idx|
      break if strand[idx].nil?
      difference_count += 1 unless base == strand[idx]
    end
    difference_count
  end

  private

  attr_reader :strand
end