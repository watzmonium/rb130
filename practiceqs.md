def a_method(&expecting_a_block)
  expecting_a_block.call
end

p a_method {"I'm a block in Example 2" }

In this code, a method `a_method` is defined that explicitly requires a block as denoted by the `&` unary operator in the parameter syntax for `expecting_a_block`. This means that when `a_method` is called on line 5, it will require a block or else an error will be raised.

Once the method is called with the block as an explicit argument, it will be converted from a block into a `Proc` object, and then it can be invoked as shown on line 2 by using the `call` method on the `Proc` object `expecting_a_block`

This example shows syntax of blocks as explicit arguments in addition to arity using blocks and procs.
# =========================================================
    

def b_method(&expecting_a_block)
  expecting_a_block.call
end

b_proc = proc {"I'm a block" }
p b_method(&b_proc)  
  
In this example, the same `b_method` is defined with a parameter that requires a block excplitly. On line 5, a new `Proc` object is declared and that object is initialized and referenced by the `b_proc` local variable. the `Proc` object, `b_proc` is then passed as an argument with the `&` unary operator that will convert it to a `Proc` object. Since it is already a proc object, it will just be able to be called up when passed to `b_method` and then called on line 2 with the `call` method where it will output `"I'm a block"`

This example shows how proc objects can be passed as blocks, or saved for later in ruby.
# =========================================================

  
def c_method(expecting_a_proc)
  expecting_a_proc.call
end
  
c_proc = proc {"I'm a proc" }
p c_method(c_proc)

In this example, the method `c_method` takes a single argument that is not explicitly a block.

 Like the previous question, this code first instantiates a new `Proc` object on line 5 and references it in `c_proc` local variable. the variable is then passed as an argument to `c_method` where it will be referenced by the parameter `expecting_a_proc`. The `call` method is then called on it, which will output `"I'm a proc"` because procs are flexible enough in ruby to be passed into methods as any object would be without explicitly requiring one is passed.

 This code is an example of implicitly passing a proc as an argument, though the `call` method might throw an error if a different type of object were passed as well.

 1, What are closures?

closures is a term that generally means 'a reusable chunk of code' that in ruby, specifically refers to blocks, procs, and lambdas. closures are a bit different than methods because they retain references to variables within their scope when they are declared/instantiated, and because the specific state of that closure can be reused.

as stated before, in ruby there are 3 types of closures with blocks being extremely common and allowed to be implicitly passed to any object. Procs and lambdas are both `Proc` objects that can act the same way as blocks do, though lambdas have more strict arity.

2, What is binding?

binding in this context refers to the local scope of variables and the values of those variables. closures keep track of the local variables within their scope at the time of their creation, and whatever the value of those variables is or has become when they are passed as arguments to methods.

3, How does binding affect the scope of closures?

binding in ruby means that the scope of closures is limited to the variables within the scope of the closure itself at its creation, and whatever those values are when the block is referenced.

for example, in the following code:

```ruby
def some_method(procy)
  procy.call
end

a = 'hi'
b = 'bye'
a = 'goodbye'
c = proc { a + b }
p some_method c
b = 'hi again'

p some_method c
```

when `some_method` is called and passed the block on line 9, the variable `a` will have the value of `goodbye` and `b` will have the value of `bye` because those were the values of the variable when the `Proc` was passed to `some_method`. However on line 11, the value of `b` has been reassigned to `'hi again'`, and the proc's binding updates this information so the value of `a` passed here will still be `'goodby'` but `b` will now have a value of `'hi again'` leading to different outputs each time the proc is passed to the method.

4, How do blocks work?

blocks are defined with curly braces `{}` with usually some code written in them after a method call. All methods in ruby implicitly accept blocks, though not every method has functionality to use those blocks. many methods will have a `yield` keyword to yield to the code within the block, and usually with the `if block_given?` syntax to ensure that the function still works without a block being passed. this allows flexability for how a method will work according to user specifications.

5, When do we use blocks? (List the two reasons)

We use blocks when we want to leave some implimentation of a method to the user or when we need to perform some actions before and after some code is run.

For example, when we use the `each` method, one usually passes a block to it to specifically say what you want to do with each object that the method iterates over. This allows you to specify based on the needs of the object or program what the each method does on each iteration.

Also, it can be useful to run some code before and after a block. A method may need to open a file, for example, reference information from that file with the block, and the close that file. This can be refered to as 'sandwich code' and is another useful feature of blocks.

6, Describe the two reasons we use blocks, use examples.
seems the same as 5?

7, When can you pass a block to a method? Why?

addressed above but always

8, How do we make a block argument manditory?

using the & unary operator

9, How do methods access both implicit and explicit blocks passed in?

explicit blocks are convereted to Proc objects and referenced with Proc.call vs implcit is yield with optional arguments

10, What is yield in Ruby and how does it work?

yield defers implimentation to the block and its binding 

11, How do we check if a block is passed into a method?

block_given?

12, Why is it important to know that methods and blocks can return closures?

methods and blocks return the last evaluated bit of code. As a result, a method can return a closure that can then be used for some other purpose

13, What are the benifits of explicit blocks?

lets you gurantee use of a block in a method because it throws an error without one

14, Describe the arity differences of blocks, procs, methods and lambdas.

blocks and procs are lenient, lambdas are strict

15, What other differences are there between lambdas and procs? (might not be assessed on this, but good to know)

16, What does & do when in a the method parameter?


explicit block

def method(&var); end

17, What does & do when in a method invocation argument?

method(&var)

in method invocation & allows a proc object to be passed to a method as a block or can be used with a symbol for syntactic sugar.

18, What is happening in the code below?

arr = [1, 2, 3, 4, 5]

p arr.map(&:to_s) # specifically `&:to_s`

this is ruby syntactic sugar for 'symbol to proc'. Some methods in ruby can be called with this syntax as a shorthand for something like `{ |obj| obj.to_s }`

19, How do we get the desired output without altering the method or the method invocations?

def call_this
  yield(2)
end

to_s = proc { |num| num }
to_i = proc { |num| "#{num}"}

p call_this(&to_s) # => returns 2
p call_this(&to_i) # => returns "2"

20, How do we invoke an explicit block passed into a method using &? Provide example.

block.call

21, What concept does the following code demonstrate?

def time_it
  time_before = Time.now
  yield
  time_after= Time.now
  puts "It took #{time_after - time_before} seconds."
end

sandiwch code

22, What will be outputted from the method invocation block_method('turtle') below? Why does/doesn't it raise an error?

def block_method(animal)
  yield(animal)
end

block_method('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end

this is a turtle and a .

23, What will be outputted if we add the follow code to the code above? Why?

block_method('turtle') { puts "This is a #{animal}."}

undefined variable

24, What will the method call call_me output? Why?

def call_me(some_code)
  some_code.call
end

name = "Robert"
chunk_of_code = Proc.new {puts "hi #{name}"}
name = "Griffin"

call_me(chunk_of_code)


25, What happens when we change the code as such:

def call_me(some_code)
  some_code.call
end

chunk_of_code = Proc.new {puts "hi #{name}"}
name = "Griffin"

call_me(chunk_of_code)

undefined variable name
26, What will the method call call_me output? Why?

def call_me(some_code)
  some_code.call
end

name = "Robert"

def name
  "Joe"
end

chunk_of_code = Proc.new {puts "hi #{name}"}

call_me(chunk_of_code)

ruby prioritizes local variables with name confusion

27, Why does the following raise an error?

def a_method(pro)
  pro.call
end

a = 'friend'
a_method(&a)


28, Why does the following code raise an error?

def some_method(block)
  block_given?
end

bl = { puts "hi" }

p some_method(bl)


29, Why does the following code output false?

def some_method(block)
  block_given?
end

bloc = proc { puts "hi" }

p some_method(bloc)
30, How do we fix the following code so the output is true? Explain

def some_method(block)
  block_given? # we want this to return `true`
end

bloc = proc { puts "hi" } # do not alter this code

p some_method(bloc)


31, How does Kernel#block_given? work?

32, Why do we get a LocalJumpError when executing the below code? & How do we fix it so the output is hi? (2 possible ways)

def some(block)
  yield
end

bloc = proc { p "hi" } # do not alter

some(bloc)
33, What does the following code tell us about lambda's? (probably not assessed on this but good to know)

bloc = lambda { p "hi" }

bloc.class # => Proc
bloc.lambda? # => true

new_lam = Lambda.new { p "hi, lambda!" } # => NameError: uninitialized constant Lambda
34, What does the following code tell us about explicitly returning from proc's and lambda's? (once again probably not assessed on this, but good to know ;)

def lambda_return
  puts "Before lambda call."
  lambda {return}.call
  puts "After lambda call."
end

def proc_return
  puts "Before proc call."
  proc {return}.call
  puts "After proc call."
end

lambda_return #=> "Before lambda call."
              #=> "After lambda call."

proc_return #=> "Before proc call."

35, What will #p output below? Why is this the case and what is this code demonstrating?

def retained_array
  arr = []
  Proc.new do |el|
    arr << el
    arr
  end
end

arr = retained_array
arr.call('one')
arr.call('two')
p arr.call('three')


TESTING WITH MINITEST
36, What is a test suite?

37, What is a test?

38, What is an assertion?

39, What do testing framworks provide?

40, What are the differences of Minitest vs RSpec

41, What is Domain Specific Language (DSL)?

42, What is the difference of assertion vs refutation methods?

43, How does assert_equal compare its arguments?

44, What is the SEAT approach and what are its benefits?

45, When does setup and tear down happen when testing?

46, What is code coverage?

47, What is regression testing?

CORE TOOLS
48, What are the purposes of core tools?

49, What are RubyGems and why are they useful?

50, What are Version Managers and why are they useful?

51, What is Bundler and why is it useful?

52, What is Rake and why is it useful?

53, What constitues a Ruby project?