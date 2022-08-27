require 'minitest/autorun' # the library needed to run tests
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'car' # kernel method - tries to load library named 'str' relative to path

class CarTest < MiniTest::Test # inherits from library class
  def test_wheels # assertion? Does this autorun because of /autorun?
    car = Car.new
    assert_equal(4, car.wheels)
  end
  
  def test_name
    skip
    car = Car.new
    assert_equal('poop', car.name)
  end
end