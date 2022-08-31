text = %(We read "War of the Worlds".)
puts text.sub(/(['"]).+\1/, '\1The Time Machine\1')
# prints: We read "The Time Machine".