a = 'The lazy cat sleeps.
The number 623 is not a word.
Then, we went to the movies.
Ah. The bus has arrived.'

b = a.scan(/^The\b/)
p b # => ["The", "The"]

# match returns first
# scan returns all instances
# =~ returns index

# /^https?:\/\/\S*$/

# http://launchschool.com/ #matches
# https://mail.google.com/mail/u/0/#inbox #matches
# htpps://example.com
# Go to http://launchschool.com/
# https://user.example.com/test.cgi?a=p&c=0&t=0&g=0 hello #DOESNT MATCH 
#     http://launchschool.com/

# fetch_url(text) if text.match(/\Ahttps?:\/\/\S+\z/)

# /^,(\d+,){3,6}$/

# ,123,456,789,123,345, #
# ,123,456,,789,123,
# ,23,56,7, #
# ,13,45,78,23,45,34, #
# ,13,45,78,23,45,34,56,