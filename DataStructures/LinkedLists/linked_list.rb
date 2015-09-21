class Node
  attr_accessor :node, :nxt

  def initialize( node, nxt = nil )
    @node, @nxt = node, nxt
  end
end

class LinkedList
  attr_accessor :size

  def initialize(node)
    @head = Node.new(node)
    @size = 1
    @tail = @head
  end

  def add_last(value)
    @tail.nxt = Node.new(value)
    @tail = @tail.nxt
    add_size
    self
  end

  def add_first(value)
    new_node = Node.new(value)
    new_node.nxt = @head
    @head = new_node
    add_size
    self
  end

  def to_s
    current = @head
    str = ""
    while !current.nil?
      str += str.empty? ? "#{current.node}" : "->#{current.node}" 
      current = current.nxt
    end
    str 
  end

  def delete(value)
    current = @head
    if current.node == value
      @head = current.nxt
      add_size -1
      true
    else
      while !current.nxt.nil?
        if current.nxt.node == value
          if current.nxt == @tail             # in the case the node to delete node is the last
            @tail = current
            @tail.nxt = nil
          else
            current.nxt = current.nxt.nxt     # in the case the node to delete is the middle
          end
          add_size -1
          return true
        end
        current = current.nxt
      end
      false
    end
  end

  private
  def add_size(how_many = 1)
    @size += how_many
  end
end
