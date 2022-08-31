items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do |*first, second|
  puts first.join(', ')
  puts second
end

# Let's start gathering food.
# apples, corn, cabbage
# wheat
# We've finished gathering!

gather(items) do |first, *seconds, third|
  puts first
  puts seconds.join(', ')
  puts third
end

# Let's start gathering food.
# apples
# corn, cabbage
# wheat
# We've finished gathering!

gather(items) do |first, *rest|
  puts first
  puts rest.join(', ')
end

# Let's start gathering food.
# apples
# corn, cabbage, wheat
# We've finished gathering!

gather(items) do |*firsts, last|
  puts "#{firsts.join(', ')} and #{last}"
end

# Let's start gathering food.
# apples, corn, cabbage, and wheat
# We've finished gathering!