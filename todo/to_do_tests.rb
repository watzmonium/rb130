require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'todolist'



class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  # Your tests go here. Remember they must start with "test_"
  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    assert_equal(@todo1, @list.shift)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    assert_equal(@todo3, @list.pop)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done?
    refute(@list.done?)
  end

  def test_wrong_object
    assert_raises(TypeError) { @list << 'hi'}
    assert_raises(TypeError) { @list << 2 }
  end

  def test_shovel
    @list << Todo.new("eat cheetoes")
    @todos << Todo.new("eat cheetoes")
    assert_equal(@todos, @list.to_a)
  end

  def test_add_alias
    @list.add(Todo.new("eat cheetoes"))
    @todos << Todo.new("eat cheetoes")
    assert_equal(@todos, @list.to_a)
  end
  
  def test_item_at
    assert_equal(@todo1, @list.item_at(0))
    assert_raises(IndexError) { @list.item_at(4) }
  end

  def test_mark_done_at
    @list.mark_done_at(0)
    assert(@list.item_at(0).done)
    assert_raises(IndexError) { @list.mark_done_at(4) }
  end

  def test_mark_undone_at
    @list.mark_done_at(0)
    @list.mark_undone_at(0)
    assert_equal(false, @list.item_at(0).done)
    assert_raises(IndexError) { @list.mark_undone_at(4) }
  end

  def test_done!
    @list.done!
    assert(@list.done?)
  end

  def test_remove_at
    assert_raises(IndexError) { @list.remove_at(4) }
    @todos.delete(@todo2)
    @list.remove_at(1)
    assert_equal(@todos, @list.to_a)
  end

  def test_to_s
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    --- Today's Todos ---
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym

    OUTPUT
  
    assert_equal(output, @list.to_s)
  end

  def test_to_s_done
    @list.mark_done_at(1)
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    --- Today's Todos ---
    [ ] Buy milk
    [X] Clean room
    [ ] Go to gym

    OUTPUT
  
    assert_equal(output, @list.to_s)
  end

  def test_to_s_all_done
    @list.done!
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    --- Today's Todos ---
    [X] Buy milk
    [X] Clean room
    [X] Go to gym

    OUTPUT
  
    assert_equal(output, @list.to_s)
  end

  def test_each
    @list.each { |todo| todo.done! }
    assert(@list.done?)
  end

  def test_each_return
    val = @list.each { 'hi' }
    assert_same(@list, val, "they are not the same object!")
  end

  def test_select
    val = @list.select { 1 > 0 }
    refute_same(val, @list)
  end
end