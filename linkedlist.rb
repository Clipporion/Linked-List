class Node
  attr_accessor :value, :next_one

  def initialize(value = nil, next_one = nil)
    @value = value
    @next_one = next_one
  end
end

class List
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    newnode = Node.new(value)
    if @head.nil?
      @head = newnode
      @tail = newnode
    else
      current = @head
      until current.next_one.nil?
        current = current.next_one
      end
      @tail = Node.new(value)
      current.next_one = @tail
    end
  end

  def prepend(value)
    newnode = Node.new(value)
    if @head.nil?
      @head = newnode
      @tail = newnode
    else
      @head = Node.new(value, @head)
    end
  end

  def size
    current_node = @head
    counter = 0
    until current_node.nil?
      counter += 1
      current_node = current_node.next_one
    end
    puts "The list is #{counter} items long"
  end

  def at(index)
    pointer = 0
    current = @head
    until pointer == index || current.nil?
      current = current.next_one
      pointer += 1
    end
    if current.nil?
      puts "No value at index #{index}"
    else
      puts "The value at index #{index} is #{current.value}"
    end
  end

  def pop
    if @head.next_one.nil?
      temp = @head.value
      @head = nil
      temp
    else
      prev = @head
      current = @head.next_one
      until current.next_one.nil?
        prev = current
        current = current.next_one
      end
      @tail = prev
      @tail.next_one = nil
      current.value
    end
  end

  def contains?(value)
    current = @head
    until current.nil?
      if current.value == value
        return true
      else
        current = current.next_one
      end
    end
    false
  end

  def find(value)
    index = 0
    current = @head
    until current.nil?
      if current.value == value
        return puts "Value #{value} is at index #{index}"
      else
        current = current.next_one
        index += 1
      end
    end
    puts "Value #{value} is not in this list"
  end

  def insert_at(value, index)
    if index.zero?
      append(value)
    else
      pointer = 0
      prev = nil
      current = @head
      until pointer == index || current.next_one.nil?
        prev = current
        current = current.next_one
        pointer += 1
      end
      if pointer == index
        prev.next_one = Node.new(value, prev.next_one)
      else
        puts "Index #{index} not found in this list"
      end
    end
  end

  def remove_at(index)
    if index.zero?
      @head = @head.next_one
    else
      pointer = 0
      prev = nil
      current = @head
      until pointer == index || current.next_one.nil?
        prev = current
        current = current.next_one
        pointer += 1
      end
      if pointer == index
        prev.next_one = current.next_one
      else
        puts "Index #{index} not found in this list"
      end
    end
  end

  def printing
    if @head.nil?
      puts 'Nothing in the list'
    else
      current = @head
      until current.nil?
        print "(#{current.value}) -> "
        current = current.next_one
      end
    end
    print 'nil'
    puts
  end
end

newlist = List.new
newlist.append(1)
newlist.append(2)
newlist.prepend(22)
newlist.append(3)
newlist.append(9)
newlist.append(30)
newlist.prepend(55)
newlist.size
newlist.at(1)
newlist.at(12)
puts newlist.tail.value
puts newlist.pop
puts newlist.tail.value
puts newlist.contains?(22)
puts newlist.contains?(99)
newlist.find(9)
newlist.find(100)
newlist.printing
newlist.insert_at(3,33)
newlist.insert_at(33,3)
newlist.printing
newlist.remove_at(33)
newlist.remove_at(3)
newlist.printing
