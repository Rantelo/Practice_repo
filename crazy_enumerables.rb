module Enumerable
# TODO: my_each
  def my_each
    return enum_for(:my_each) unless block_given?
    for i in (0...self.size)
      yield(self[i])
    end
	end

# TODO: my_each_with_index
  def my_each_with_index
    return enum_for(:my_each_with_index) unless block_given?
    for i in (0...self.size)
      yield(self[i], i)
    end
  end

# TODO: my_select
  def my_select
    return enum_for(:my_select) unless block_given?
    result = []
    self.my_each do |e|
      result.push(e) if yield(e)
    end
    result
  end

# TODO: my_all?
  def my_all?
    if block_given?
      for e in self
        return false unless yield(e)
      end
    else
      for e in self
        return false if e.nil? || e == false
      end
    end
    true
  end

# TODO: my_any?
  def my_any?
    if block_given?
      for e in self
        return true if yield(e)
      end
    else
      for e in self
        return true if !e.nil? && e != false
      end
    end
    false
  end

# TODO: my_none
  def my_none  
  end

# TODO: my_count
  def my_count
  end

# TODO: my_map
  def my_map
  end

# TODO: my_inject
  def my_inject
  end

# NOTE: Test #my_inject by creating a method called #multiply_els which multiplies all the elements of the array together by using #my_inject, e.g. multiply_els([2,4,5]) #=> 40

# TODO: Modify your #my_map method to take a proc

# TODO: Modify your #my_map method to take either a proc or a block, executing the block only if both are supplied (in which case it would execute both the block AND the proc).

end