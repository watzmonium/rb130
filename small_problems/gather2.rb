def gather2(ary)
  return unless ary.class == Array
  yield(ary) if block_given?
end

raven = %w(raven finch hawk eagle)

p gather2(raven) { |_,_, *raptors| raptors.each { |raptor| puts raptor }}