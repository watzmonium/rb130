def step(starting, ending, num_by)
  while starting <= ending do
    yield(starting)
    starting += num_by
  end
  ending
end

step(1, 10, 3) { |value| puts "value = #{value}" }