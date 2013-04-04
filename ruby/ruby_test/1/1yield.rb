def demo_of_yield 
  puts "Executing the method body..."
  puts "About to yield control to the block..."
  yield
  puts "Back from the block-finished!"
end

demo_of_yield { puts ">Control has been passed to the block!"}