class RomanNumeral
  NUMERALS = { 1 => { one: 'I', five: 'V', ten: 'X' },
               2 => { one: 'X', five: 'L', ten: 'C' },
               3 => { one: 'C', five: 'D', ten: 'M' },
               4 => { one: 'M', five: 'V_', ten: 'X_' } }.freeze

  TIME_PRINTS = [{ one: 0 }, { one: 1 }, { one: 2 }, { one: 3 }, { one: 1, five: 1 }, { five: 1 },
                 { five: 1, one: 1 }, { five: 1, one: 2 }, { five: 1, one: 3 }, { one: 1, ten: 1 }].freeze

  def initialize(num)
    @digit = num
  end

  def to_roman
    r_num = digit.to_s.chars
    numeral_size = r_num.size
    numeral_string = ''

    r_num.each do |number|
      numeral_string << transform_digits(number, numeral_size)
      numeral_size -= 1
    end
    numeral_string
  end

  private

  attr_reader :digit

  def transform_digits(number, numeral_index)
    TIME_PRINTS[number.to_i].each_with_object('') do |(place_value, reps), str|
      reps.times { str << NUMERALS[numeral_index][place_value] }
    end
  end
end
