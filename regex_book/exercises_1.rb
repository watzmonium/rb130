# s1 = ['Kx', 'BlacK', 'kelly']

# s1.each { |word| puts /K/.match(word)}

# s2 = ['Henry', 'perch', 'golf']

# s2.each { |word| puts /h/i.match(word)}
# s2.each { |word| puts /(h|H)/i.match(word)}

# s3 = 'bearded dragon'

# p /dragon/.match(s3)

# s4 = ['banana', 'orange', 'pineapples', 'strawberry', 'raspberry','grappler']

# s4.each { |word| puts /(banana|orange|apple|strawberry)/.match(word) }

# /bl\w+berry/ # matches blueberry and blackberry but not blue berry or strawberry
# /(blue|black)berry/

s5 = 'Four score + seven'

p /[FX]/.match(s5) # => 'F'
p /[e+]/.match(s5) # => 'e' but it matches + also!
p /[abAB]/.match(s5) # => nil
p /[*+]/.match(s5) # => '+' wtf???

