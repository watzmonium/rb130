require 'minitest/autorun'

require_relative 'car'

describe 'Car#wheels' do # no class here - the describe method
  it 'has 4 wheels' do # it here
    _(car.wheels).must_equal 4           # this is the expectation, _ syntax
  end
end