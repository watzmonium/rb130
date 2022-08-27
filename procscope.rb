def call_me(some_code)

  p block_given?
end

name = "Robert"
chunk_of_code = Proc.new {puts "hi #{name}"}
call_me('hi')
name = "Griffin III"        # re-assign name after Proc initialization

