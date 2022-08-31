# basics

  /something/
  /cat/ will match s(cat), cat(egory), but NOT CAT or c a t

# syntax

  =~ returns the first index of a matching substring
  order of regexp and string literal don't matter
    i.e. /hay/ =~ 'haystack == 'haystack' =~ /hay
  /hay/ =~ 'haystack' => 0 because that's the index of the start of the match
  /a/ =~ 'haystack' => 1 # note that only returns the first match in this way
  /u/ =~ 'haystack' => nil

  using /regex/.match('string_lit') returns a MatchData object that has attributes of the matching chars

  certain characters are 'metacharacters' and must be escaped
  metacharacters change rules inside []

  alternation:
    | character
    /(cat|dog|rabbit)/ will match any of those words!

  \n - new line
  \r 

  /regex/i <- flag character ignores case
  
  [] - square brackets are for a set of characters and will only match a single occurance

    'Four score + seven'
      [FX] => F # single character! matches stuff in the brackets

    Character classes also come in handy when you need to check for uppercase and lowercase letters, but can't use the i flag to make the entire regex case insensitive. For example, /[Hh]oover/ matches Hoover or hoover, but not HOOVER.

    meta-characters inside of character class brackets:
      ^ \ - [ ]
    

# specific regex usage

  # Shortcuts
  /[aeiou]/ - [] denote character class
  /[a-z]/ - `-` denotes a range of characters but this only matches 1 character
  /./ - any character except a newline
  /./m - any character at all
  /\w\ - a word character a-zA-Z0-9_ # note this includes underscores
  /\W\ - everything ELSE except above
  /^regex/ - EXCLUDES all `regex`
  /\d/ - a digit 0-9
  /\D/ - everyting ELSE
  /\h/ - hex digit
  /\H/ - everything else
  /\s/ - a 'whitespace' character /[ \t\r\n\f\v]/
  /\S/ - everythng else
  /\R/ - a linebreak

  # options
  * - zero+ times
  + - 1+ times
  ? - zero or 1 times (optional)
    /jpe?g/ matches jpg and jpeg
  {n} - exactly n times
  {n,} - AT LEAST n times
  {,m} - m or less times
  {n,m} - at least n, not more than m
  ^ - negate something

  # anchors
  - anchors limit how matching can occur. Where to start/end
  ^ - beginning of LINE
  $ - end of LINE
  \A - beginning of STRING (not line)
  \Z - end of STRING 
  \z - end of STRING including new line << use this one

  in general, use \A and \z over ^ or $ unless you're intentionally working with multi-line stuff

  \b - word boundaries
  \B - non word boundaries

  what is a word boundary? 
    \w\W\w i.e. word character, non word char, word char
    beginning of a string first character is a word character
    end of a string last char is a word char

  # quantifiers
  * - zero or more occurances of left thing
  + - one or more
  ? - zero or one
  ? - lazy match (min number of chars)

  # capture groups

  idea - capture starting and ending
    /['"].+?['"]/
      won't work - gets both single and double quotes

    /(['"]).+?\1/
      this \1 is known as a backreference to the first captured symbol
    
    regex may contain multiple capture groups, numbers from left to right as groups 1, 2, 3, and so on, up to 9. As you might expect, the backreferences are \1, \2, \3, ..., and \9.

  # transformig

  sub and gsub

  sub is only first instance
  gsub is all

  text = %(We read "War of the Worlds".)
  puts text.sub(/(['"]).+\1/, '\1The Time Machine\1')
    prints: We read "The Time Machine".
  puts text.sub(/(['"]).+\1/, "\\1The Time Machine\\1") <= bad!