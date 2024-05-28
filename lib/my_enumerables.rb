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
    my_each do |element|
      arr << element if yield element
    end
    arr
  end

  def my_all?
    for_all = true
    my_each_with_index do |element, index|
      if block_given?
        unless yield element
          for_all = false
          break
        end
      else
        unless self[index]
          for_all = false
          break
        end
      end
    end
    for_all
  end

  def my_any?
    for_any = false
    my_each_with_index do |element, index|
      if block_given?
        if yield element
          for_any = true
          break
        end
      elsif self[index]
        for_any = true
        break
      end
    end
    for_any
  end

  def my_none?
    none = true
    my_each_with_index do |element, index|
      if block_given?
        if yield element
          none = false
          break
        end
      elsif self[index]
        none = false
        break
      end
    end
    none
  end

  def my_count(obj = nil)
    counter = 0
    my_each do |element|
      if obj.nil?
        if block_given?
          counter += 1 if yield element
        else
          counter += 1
        end
      elsif include?(obj)
        counter += 1
      end
    end
    counter
  end

  def my_map
    arr = []
    my_each do |element|
      return to_enum(:my_map) unless block_given?

      arr << yield(element)
    end
    arr
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
