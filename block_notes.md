# Blocks

# Closures

  a closure is a general programming concept that lets a programmer save a chunk of code and execute it later
    question: how is this different than a funciton??
  
    it is said to bind its surrounding artifacts (variables and methods) and build an
    'en'closure around everything to be referenced later when the closure is executed

    Think of it as an undefined method (lambda function?)
       "Closures are to lambdas as objects are to classes" - google
      so, closures are instances of lambdas?

    in ruby, closures are implimented through a `proc` object, a lambda, or a block
      so we can pass procs, lambdas, and blocks around

    # The only thing to remember is that this "chunk of code" retains references to its surrounding artifacts -- its binding. #

    making closures
    1) instantiate an object from the `Proc` class
    2) use `lambdas`
    3) use `blocks`

# Blocks

  In Ruby, every method can take an optional block as an implicit argument.

  `yeield` - yield in a method definition invokes the block passed in as an argument

  `block_given?` is a kernel function that can be used to deal with no blocks

  |num| - BLOCK LOCAL VARIABLE - scope constrained to the block

  return value of blocks is last evaluated expression - just like methods

# Arity

  Rule regarding number of args you have to pass to a block, proc, lambda

  blocks nad procs have LENIENT arity - doesn't care # of args

  Methods and lambdas have STRICT arity

# When to use blocks?

  1) Let the method decide how to implement code
    method implementor - person who wrote the method and not always sure how it will be used
    method caller - person using the method

    blocks let the implementor or even the caller decide how to best use this method

    # If you encounter a scenario where you're calling a method from multiple places, with one little tweak in each case, it may be a good idea to try implementing the method in a generic way by yielding to a block. #

  2) Methods that need to perform some before and after sandwich code

    e.g. time before and time after, logging, notification systems
          resource management, interfacing with OS

          i.e. File.open('somefile.txt', 'w')
               File.close

  3) Methods with an explicit block parameter

    remember, all methods IMPLICITLY take blocks, whether they use them or not
    however sometimes you want a method to EXPLICITLY take a named block

     To define an explicit block, you simply add a parameter to the method definition where the name begins with an & character i.e. `def test(&block)`

     # &block
      &block is a special parameter that turns a block argument into a 'simple' Proc object
      drop the & when referring to it as a local variable

      block.call => this is a Proc method for invoking the block
      block.call(arg) => sends the argument to the block

# Summary

  1) blocks are one way that Ruby implements closures. Closures are a way to pass around an unnamed "chunk of code" to be executed later. They retain their scope and variables

  2) blocks can take arguments, just like normal methods. But unlike normal methods, it won't complain about wrong number of arguments passed to it.
    i.e. block(asdf) => { |thing| } << thing is asdf
         yield(asdf)

  3) blocks return a value, just like normal methods. (last resolved code)

  4) blocks are a way to defer some implementation decisions to method invocation time. It allows method callers to refine a method at invocation time for a specific use case. It allows method implementors to build generic methods that can be used in a variety of ways.

  5) blocks are a good use case for "sandwich code" scenarios, like closing a File automatically.

  6) methods and blocks can return a chunk of code by returning a Proc or lambda.

