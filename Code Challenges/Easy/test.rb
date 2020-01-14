def ze_method(proc_1, proc_2)
  proc_1.call("Bob", "Jerry") # procs don't enforce arguement arity, extra arguments are ignored, assigns 'nil' values when not enough args supplied
  proc_2.call("Joe", "Karl")
end

example_proc = proc { |n| puts "Hey there #{n}!" }
another_proc = proc { |person| puts "This is #{person}" }

ze_method(example_proc, another_proc)

puts "-----"

def foo_method(name, &block)
  block.call(name)
end

foo_method("jennica") { |name| puts "#{name.capitalize}, my old friend " }

my_lamba = lambda do |person_1, person_2| 
  puts "#{person_2} told me that this old fermented animal milk is wonderful #{person_1}."
  end

puts "-----"

ze_method(my_lamba, example_proc) # => enforced argument arity means Arg error thrown if arity is off

puts "-----"

def foo_method(fruit, &block)
  block.call(fruit)
end

foo_method("Apple") { |fruit| puts "#{fruit} juice is tasty"}

puts "-----"

my_other_lamba = -> (person_1, person_2) do # => alternate lambda creation syntax, note that -> is followed by parenthesis with block local variable paramters, and no pipes
  puts "#{person_2} told me that this old fermented animal milk is wonderful #{person_1}."
  end

ze_method(my_lamba, my_other_lamba)

def example_method(proc_1, proc_2)
  puts "Before procs"
  proc_1.call("Bob", "Jerry")
  proc_2.call("Joe", "Karl")
  puts "After procs"
end

proc_1 = proc { |n| puts "Hey there #{n}!" }
proc_2 = proc do |person| 
  puts "In proc_2"
  next if person == 'Joe'
  puts "Hi #{person}, we're still in proc_2"
end

example_method(proc_1, proc_2)


