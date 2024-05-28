module Enumerable
  # Your code goes here
  def my_each_with_index
    counter = 0
    length.times do
      yield self[counter], counter
      counter += 1
    end
    self
  end

  def my_select
    arr = []
    each do |element|
      arr << element if yield element
    end
    arr
  end

  def my_all?
    for_all = true
    each do |element|
      unless yield element
        for_all = false
        break
      end
    end
    for_all
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    counter = 0
    length.times do
      yield self[counter]
      counter += 1
    end
    self
  end
end
