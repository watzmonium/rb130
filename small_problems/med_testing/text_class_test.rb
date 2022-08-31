require 'minitest/autorun'

require_relative 'text_class'

class TextTest < MiniTest::Test
  def setup
    @file = File.open('sample_text.txt', 'r')
  end

  def test_swap
    changed_text = @file.read
    sample_text = Text.new(changed_text)
    assert_equal(changed_text.gsub('o', '#'), sample_text.swap('o', '#'))
  end
  
  def test_word_count
    text = @file.read
    sample_text = Text.new(text)
    words = text.split.count
    assert_equal(words, sample_text.word_count)
  end

  def teardown
    @file.close
    puts "File has been closed: #{@file.closed?}"
  end
end