class Book
  attr_accessor :tittle, :author, :year, :isbn
  
  def clone
    c = super #call the original method
    c.tittle = c.tittle.clone
    c.author = c.author.clone
    return c
  end
end

b1 = Book.new
b1.tittle = "The Hunger Games"
b1.author = "Suzanne Collins"
b1.year = 2008
b1.isbn = 9780439023528

b2 = b1.clone #shallow copy, not good implementation
b2.tittle = "Catching Fire"
b2.author[0] = "Z"
p b1
p b2