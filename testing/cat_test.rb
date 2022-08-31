require 'minitest/autorun'

require_relative 'cat'

class CatTest < MiniTest::Test
  def setup
    @kitty = Cat.new('Kitty')
  end

  # def test_is_cat; end

  def test_name
    assert(@kitty.name == 'Kitty')
  end

  # def test_miaow; end

end