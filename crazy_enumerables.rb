module Enumerable
  def my_each
    return enum_for(:my_each) unless block_given?
    for i in (0...self.size)
      yield(self[i])
    end
	end

  def my_each_with_index
    return enum_for(:my_each_with_index) unless block_given?
    for i in (0...self.size)
      yield(self[i], i)
    end
  end

  def my_select
    return enum_for(:my_select) unless block_given?
    result = []
    self.my_each do |e|
      result.push(e) if yield(e)
    end
    result
  end

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

  def my_none?
    if block_given?
      for i in self
        return false if yield(i)
      end
    else
      for i in self
        return false if !i.nil? && i != false
      end
    end
    true
  end

  def my_count(*arg)
    raise ArgumentError, "wrong number of arguments (#{arg.size} for 1)" if arg.size > 1
    return self.size if arg.size == 0
    return self.my_select{|e| yield(e)}.size if block_given?
    return self.my_select{|e| e == arg[0]}.size
  end

  def my_map(proc = nil)
    result = []
    for e in self
      if proc && block_given?
        result.push(yield(proc.call(e)))
      elsif proc
        result.push(proc.call(e))
      elsif block_given?
        result.push(yield(e))
      else
        result.push(e)
      end
    end
    result
  end

  def my_inject(*arg)
    raise ArgumentError, "wrong number of arguments (#{arg.size} for 1 or 2)" if arg.size > 2
    if arg.size == 0
      raise LocalJumpError, "no block given" unless block_given?
      for e in self
        memo = yield(memo, e)
      end
    elsif arg.size == 1
      if arg[0].is_a?(Symbol)
        memo = (arg[0].to_s == "+" || arg[0].to_s == "-") ? 0 : 1
        self.my_each{|e| memo = e.send(arg[0],memo)}
      else
        raise LocalJumpError, "no block given" unless block_given?
        memo = arg[0]
        for e in self
          memo = yield(memo, e)
        end 
      end
    elsif arg.size == 2
      memo = arg[0]
      self.my_each{|e| memo = memo.send(arg[1], e)}
    end
    memo 
  end
end

def multiply_els(arr)
  arr.my_inject(:*)
end
