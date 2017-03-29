fibo = Enumerator.new do |yielder|
  a = 0
  b = 1
  loop do
    yielder << a
    a, b = b, a + b
  end
end

p fibo.take(10)



e = Enumerator.new do |y|
  n = 1
  loop do
    y << n
    n *= 2
  end
end

p e.take(10)

class EnumeratorAdapter

  def initialize(enum)
    @enum = enum
  end

  def has_next?
    begin
      @enum.peek
      true
    rescue StopIteration
      false
    end
  end

  def item
    has_next? ? @enum.peek : nil
  end

  def next_item
    has_next? ? @enum.next : nil
  end

end