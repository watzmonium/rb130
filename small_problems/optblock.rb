def compute(arg)
  if block_given?
    yield(arg)
  else
    'Does not compute.'
  end
end

# p compute { 5 + 3 } == 8
# p compute { 'a' + 'b' } == 'ab'
# p compute == 'Does not compute.'

p compute(8) { |num| puts num } # => 8
p compute(8)
p compute(3) { |num| num == 3 }