# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end

# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(todo)
    raise TypeError.new "Can only add Todo objects." unless todo.class == Todo
    todos << todo
  end

  alias_method :<<, :add

  def size
    todos.size
  end

  def first
    todos[0]
  end

  def last
    todos[-1]
  end

  def to_a
    todos
  end

  def done?
    todos.all? { |todo| todo.done? }
  end

  def item_at(idx)
    raise IndexError if idx >= todos.size
    todos[idx]
  end

  def mark_done_at(idx)
    raise IndexError if idx >= todos.size
    todos[idx].done!
  end

  def mark_undone_at(idx)
    raise IndexError if idx >= todos.size
    todos[idx].undone!
  end

  def done!
    todos.each { |todo| todo.done! }
  end

  def shift
    todos.shift
  end

  def pop
    todos.pop
  end

  def remove_at(idx)
    raise IndexError if idx >= todos.size
    todos.delete_at(idx)
  end

  def to_s
    list = "--- Today's Todos ---\n"
    todos.each { |todo| list += todo.to_s + "\n" }
    list
  end

  def each
    todos.each do |todo|
      yield(todo)
    end
    self
  end

  def select
    todos.each_with_object(TodoList.new('')) do |todo, list|
      list << todo if yield(todo)
    end
  end

  def find_by_title(str)
    self.each do |todo|
      return todo if todo.title == str
    end
    nil
  end

  def all_done
    self.select { |todo| todo.done? }
  end

  def all_not_done
    self.select { |todo| !todo.done? }
  end

  def mark_done(str)
    todo = find_by_title(str)
    todo.done! unless todo.nil?
  end

  def mark_all_done
    self.each do |todo|
      todo.done!
    end
  end

  def mark_all_undone
    self.each do |todo|
      todo.undone!
    end
  end

  private

  attr_accessor :todos
end


todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

todo1.done!

p list.mark_all_undone

puts list