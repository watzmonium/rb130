#[1, 2, 3].each { |num| "do nothing" }                           # still returns [1, 2, 3]

def each(obj)
  size = obj.size
  counter = 0
  while counter < size do
    yield(obj[counter]) if block_given?
    counter += 1
  end
  obj
end

p each([1,2,3]) { |num| puts num }