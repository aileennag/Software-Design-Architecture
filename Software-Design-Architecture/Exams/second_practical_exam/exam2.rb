#==========================================================
# Aileen N Ayala García   A01166738
#==========================================================

require 'minitest/autorun'

#
# A collection implemented as a circular doubly-linked
# list.
#
# YOU MUST NOT MODIFY THIS CLASS IN ANY WAY!
#
class LinkedList

  #
  # Individual list nodes.
  #
  class Node
    attr_accessor :prev, :next, :data
    def initialize(data=nil, prev=nil, next_=nil)
      @data = data
      @prev = prev
      @next = next_
    end
  end

  #
  # Creates an empty list.
  #
  def initialize
    @sentinel = Node.new
    @sentinel.prev = @sentinel
    @sentinel.next = @sentinel
  end

  #
  # Returns true if this list is empty, otherwise
  # returns false.
  #
  def empty?
    @sentinel.next == @sentinel
  end

  #
  # Adds a new element to the start of this list.
  #
  def add_first(e)
    node = Node.new(e, @sentinel, @sentinel.next)
    @sentinel.next.prev = node
    @sentinel.next = node
  end

  #
  # Adds a new element to the end of this list.
  #
  def add_last(e)
    node = Node.new(e, @sentinel.prev, @sentinel)
    @sentinel.prev.next = node
    @sentinel.prev = node
  end

  #
  # Removes and returns the element at the start of this
  # list. Return nil if the list is empty.
  #
  def remove_first
    return nil if empty?
    node = @sentinel.next
    e = node.data
    node.next.prev = @sentinel
    @sentinel.next = node.next
    e
  end

  #
  # Removes and returns the element at the end of this
  # list. Return nil if the list is empty.
  #
  def remove_last
    return nil if empty?
    node = @sentinel.prev
    e = node.data
    node.prev.next = @sentinel
    @sentinel.prev = node.prev
    e
  end

  #
  # Calls the given block once for each element in this
  # list, passing that element as a parameter.
  #
  def each
    node = @sentinel.next
    while node != @sentinel
      yield node.data
      node = node.next
    end
  end

  #
  # Creates a string representation of this list.
  #
  def to_s
    r = []
    each do |e|
      r << e
    end
    '[' + r.join(', ') + ']'
  end

end

#----------------------------------------------------------
# Place here your code for the class QueueAdapter
# (Problem 1.a) and its iter() method (Problem 1.b).
#----------------------------------------------------------
class QueueAdapter
  include Enumerable
  
  def initialize(a)
    @a = a
  end
  
  def insert(e)
    @a.add_last(e)
    return self
  end
  
  def remove
    raise RuntimeError if empty?
    return @a.remove_first
  end
  
  def peek
    raise RuntimeError if empty?
    value = self.remove
    @a.add_first(value)
    return value
  end
  
  def empty?
    return @a.empty?
  end
  
  def iter
    iterador = Enumerator.new do |yielder|
      @a.each do |x|
        yielder << x
      end
    end
    return iterador
  end

end

#----------------------------------------------------------
# Place here your code for the class UniqueQueue
# (Problem 1.c).
#----------------------------------------------------------
require 'singleton'

class UniqueQueue < QueueAdapter
  include Singleton
  
  @@instance = LinkedList.new
  
  def initialize(a)
    @@instance = a
    return a.initialize
  end
  
  def self.instance
    return @@instance
  end
  
end
#----------------------------------------------------------
# Refactor the following code (Problem 2).
#----------------------------------------------------------
def movie_ticket_price(age, is_vip: false, is_wednesday: false)
  return price = 6.0 if is_wednesday
  return price = 7.5 if is_vip
  return price = 8.0 if age <= 12
  return price = 9.0 if age >= 60
  price = 12.00
end

#----------------------------------------------------------
class ExamTest < Minitest::Test

  def setup
    @lst = LinkedList.new
    @lst.add_first(15)
    @lst.add_last(16)
    @lst.add_first(8)
    @lst.add_last(23)
    @lst.add_first(4)
    @lst.add_last(42)
  end

  def test_adapter
    lst = LinkedList.new
    queue = QueueAdapter.new(lst)
    assert(queue.empty?)
    queue.insert(4)
    assert_equal(4, queue.peek)
    queue.insert(8)
    queue.insert(15)
    queue.insert(16)
    queue.insert(23)
    queue.insert(42)
    assert_equal(4, queue.peek)
    refute(queue.empty?)
    refute(lst.empty?)
    assert_equal('[4, 8, 15, 16, 23, 42]', lst.to_s)
    assert_equal(4, queue.remove)
    assert_equal(8, queue.peek)
    assert_equal(8, queue.remove)
    assert_equal(15, queue.peek)
    assert_equal(15, queue.remove)
    assert_equal(16, queue.peek)
    assert_equal(16, queue.remove)
    assert_equal(23, queue.peek)
    assert_equal(23, queue.remove)
    assert_equal(42, queue.peek)
    assert_equal(42, queue.remove)
    assert(queue.empty?)
    assert(lst.empty?)

    queue = QueueAdapter.new(@lst)
    refute(queue.empty?)
    assert_equal(4, queue.peek)
    assert_equal(4, queue.remove)
    assert_equal(8, queue.peek)
    assert_equal(8, queue.remove)
    assert_equal(15, queue.peek)
    assert_equal(15, queue.remove)
    queue.insert('a')
    queue.insert('b')
    queue.insert('c')
    assert_equal('[16, 23, 42, a, b, c]', @lst.to_s)
    assert_equal(16, queue.peek)
    assert_equal(16, queue.remove)
    assert_equal(23, queue.peek)
    assert_equal(23, queue.remove)
    assert_equal(42, queue.peek)
    assert_equal(42, queue.remove)
    assert_equal('a', queue.peek)
    assert_equal('a', queue.remove)
    assert_equal('b', queue.peek)
    assert_equal('b', queue.remove)
    assert_equal('c', queue.peek)
    assert_equal('c', queue.remove)

    assert(queue.empty?)
    assert_raises RuntimeError do
      queue.remove
    end
    assert_raises RuntimeError do
      queue.peek
    end
  end

  def test_iterator
    queue = QueueAdapter.new(@lst)
    itr = queue.iter

    # itr should be an instance of the Enumerator class.
    assert(itr.instance_of?(Enumerator))

    # itr should work as an external iterator.
    assert_equal(4, itr.next)
    assert_equal(8, itr.next)
    assert_equal(15, itr.next)
    assert_equal(16, itr.next)
    assert_equal(23, itr.next)
    itr.rewind
    assert_equal(4, itr.next)
    assert_equal(8, itr.next)
    assert_equal(15, itr.next)
    assert_equal(16, itr.next)
    assert_equal(23, itr.next)
    assert_equal(42, itr.next)
    assert_raises StopIteration do
      itr.next
    end

    queue.insert('a')
    queue.insert('b')
    queue.insert('c')
    itr.rewind
    assert_equal(4, itr.next)
    assert_equal(8, itr.next)
    assert_equal(15, itr.next)
    assert_equal(16, itr.next)
    assert_equal(23, itr.next)
    assert_equal(42, itr.next)
    assert_equal('a', itr.next)
    assert_equal('b', itr.next)
    assert_equal('c', itr.next)
    assert_raises StopIteration do
      itr.next
    end

    # itr should work as an internal iterator.
    data = [4, 8, 15, 16, 23, 42, 'a', 'b', 'c']
    itr.each_with_index do |e, i|
      assert_equal(data[i], e)
    end
  end

  def test_singleton
    # This should be the only way to get the unique instance.
    unique = UniqueQueue.instance
    assert_same(unique, UniqueQueue.instance)

    # Should also be an instance of a subclass of QueueAdapter.
    assert(unique.is_a?(QueueAdapter))

    # "new" method should be private.
    assert_raises(NoMethodError) do
      UniqueQueue.new
    end

    # Rest of the functionality should be identical to its
    # super class.
    assert(unique.empty?)
    unique.insert('x')
    unique.insert('y')
    unique.insert('z')
    refute(unique.empty?)
    assert_equal('x', unique.peek)
    assert_equal('x', unique.remove)
    assert_equal('y', unique.peek)
    assert_equal('y', unique.remove)
    assert_equal('z', unique.peek)
    assert_equal('z', unique.remove)
    assert(unique.empty?)
    assert_raises RuntimeError do
      unique.remove
    end
    assert_raises RuntimeError do
      unique.peek
    end
  end

  def test_replace_nested_conditional_with_guard_clauses_refactoring
    assert_equal(12.0, movie_ticket_price(18))
    assert_equal(8.0, movie_ticket_price(10))
    assert_equal(9.0, movie_ticket_price(73))
    assert_equal(6.0, movie_ticket_price(21, is_wednesday: true))
    assert_equal(7.5, movie_ticket_price(17, is_vip: true))
    assert_equal(6.0, movie_ticket_price(8, is_wednesday: true, is_vip: true))
  end

end