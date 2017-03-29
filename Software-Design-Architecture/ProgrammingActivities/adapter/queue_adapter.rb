# Adapter Pattern
# Date: 01-Mar-2017
# Authors:
#          A01166738     Aileen N. Ayala   
#          A01372276     Eduardo Castilla

class QueueAdapter
  
  def initialize(q)
    @q = q
  end
  
  def push(x)
    @q.insert(x)
    return self
  end
  
  def pop
    if empty?
      return nil
    end
    (self.size-1).times do 
      @q.insert(@q.remove) 
    end
    return @q.remove
  end
  
  def peek
    if empty?
      return nil
    end
    value = self.pop
    self.push(value)
    return value
  end
  
  def empty?
    return @q.empty?
  end
  
  def size
    return @q.size
  end
  
end 