# Exploring Procs, Lambdas, and Blocks: Definition and Arity
# This exercise covers material that you do not have to master. We provide the exercise as a way to explore the differences between procs, lambdas, and blocks.

# For this exercise, we'll be learning and practicing our knowledge of the arity of lambdas, procs, and implicit blocks. Two groups of code also deal with the definition of a Proc and a Lambda, and the differences between the two. Run each group of code below: For your answer to this exercise, write down your observations for each group of code. After writing out those observations, write one final analysis that explains the differences between procs, blocks, and lambdas.

# Group 1
# my_proc = proc { |thing| puts "This is a #{thing}." } # outputs proc object, notice called with lowercase proc, not Proc.new
# puts my_proc # reutnrs path of home directory, plus ":<line number>" of proc definition
# puts my_proc.class # Proc class
# my_proc.call # output despite no argument
# my_proc.call('cat') # output as expected


## 

# # Group 2
# my_lambda = lambda { |thing| puts "This is a #{thing}." } # ArgumentError, lambdas have strict argument requirements
my_second_lambda = -> (thing) { puts "This is a #{thing}." } # new lambda called with -> (and can be called with lowercase lambda)
# puts my_lambda
puts my_second_lambda # notice (lambda) is specified in the end of Proc encoding
puts my_lambda.class # surprisingly this is a Proc class
my_lambda.call('dog') # outputs "This is a dog."
my_lambda.call # does not execute because no argument
my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." } # Lambda is not a class, it is a type of Proc

# Group 3
def block_method_1(animal)
  yield
end

block_method_1('seal') { |seal| puts "This is a #{seal}."} # 'seal' string was not passed to yield, so not available within the block
block_method_1('seal') # LocalJumpError because no block given

# Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."} # 'turtle' string available because it was yielded to the block
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}." # number of arguements is not strictly enforced, so block executes even without the correct number of arguemtns for defined parameters
end
block_method_2('turtle') { puts "This is a #{animal}."} # NameError because generic block method parameter trying to be accessed, not the 'turtle' string that it evaluates to

# Lambdas are not a class, they are a type of Proc
# Procs are either Lambdas or non-Lambdas (regular Procs).
# => in lambdas return means exit from the proc
# => in regular procs, return means exit from the embracing method
# => in lambdas arguments are treated like methods (strictly, with ArgumentError for arguement mismatches)
# => in regular procs, missing arguments are filled with nil, single Array arguments are deconstructed if the proc has multiple arguments, and there is no error raised on extra arguments.

# Methods are not closures, they need to have parameters passed to them to be available
# Argument numbers are strictly enforced




