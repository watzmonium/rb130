def url?(string)
  !!string.match(/\Ahttps?:\/\/\S+\z/)
end

# p url?('http://launchschool.com')   # -> true
# p url?('https://example.com')       # -> true
# p url?('https://example.com hello') # -> false
# p url?('   https://example.com')    # -> false

def fields(str)
  str.split(/[ \t,]+/)
end

# p fields("Pete,201,Student")
# # -> ["Pete", "201", "Student"]

# p fields("Pete \t 201    ,  TA")
# # -> ["Pete", "201", "TA"]

# p fields("Pete \t 201")
# # -> ["Pete", "201"]

# p fields("Pete \n 201")
# # -> ["Pete", "\n", "201"]

def mystery_math(str)
  str.sub(/[-+\*\/]/, '?')
end

# p mystery_math('4 + 3 - 5 = 2')
# # -> '4 ? 3 - 5 = 2'

# p mystery_math('(4 * 3 + 2) / 7 - 1 = 1')
# # -> '(4 ? 3 + 2) / 7 - 1 = 1'

def mysterious_math(str)
  str.gsub(/[-+\*\/]/, '?')
end

# p mysterious_math('4 + 3 - 5 = 2')           # -> '4 ? 3 ? 5 = 2'
# p mysterious_math('(4 * 3 + 2) / 7 - 1 = 1') # -> '(4 ? 3 ? 2) ? 7 ? 1 = 1'

def danish(str)
  str.sub(/\b(apple|blueberry|cherry)\b/, 'danish')
end

# p danish('An apple a day keeps the doctor away')
# # -> 'An danish a day keeps the doctor away'

# p danish('My favorite is blueberry pie')
# # -> 'My favorite is danish pie'

# p danish('The cherry of my eye')
# # -> 'The danish of my eye'

# p danish('apple. cherry. blueberry.')
# # -> 'danish. cherry. blueberry.'

# p danish('I love pineapple')
# # -> 'I love pineapple'

def format_date1(str)
  str.sub(/\A(\d\d\d\d)-(\d\d)-(\d\d)\z/, '\3.\2.\1')
end

# p format_date('2016-06-17') # -> '17.06.2016'
# p format_date('2016/06/17') # -> '2016/06/17' (no change)

def format_date(str)
  str.sub(/\A(\d\d\d\d)(.)(\d\d)\2(\d\d)\z/, '\4.\3.\1.')
end

p format_date('2016-06-17') # -> '17.06.2016'
p format_date('2017/05/03') # -> '03.05.2017'
p format_date('2015/01-31') # -> '2015/01-31' (no change)