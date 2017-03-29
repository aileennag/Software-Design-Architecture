# Template Method Pattern
# Date: 25-Jan-2017
# Authors:
#          A01166738     Aileen N. Ayala   
#          A01372276     Eduardo Castilla
# File name: table_generator.rb

class TableGenerator

  def initialize(header, data)
    @header = header
    @data = data
  end

  def generate
    generate_header_row + (@data.map {|x| generate_row(x)}).join
  end

  def generate_header_row
    (@header.map {|x| generate_header_item(x)}).join
  end

  def generate_row(row)
    (row.map {|x| generate_item(x)}).join
  end
  
  def generate_item(item)
    item
  end

  def generate_header_item(item)
    item
  end

end

class CSVTableGenerator < TableGenerator

  def generate_row(row)
    "#{(row.map {|x| generate_item(x)}).join(',')}\n"
  end

  def generate_header_row
    generate_row(@header)
  end

end

class HTMLTableGenerator < TableGenerator
  
  def generate
    "<table>\n" + super + "</table>\n"
  end
  
  def generate_row(row)
    "<tr><td>"+"#{(row.map {|x| generate_item(x)}).join('</td><td>')}"+"</td></tr>\n"
  end

  def generate_header_row
    "<tr><th>"+"#{(@header.map {|x| generate_item(x)}).join('</th><th>')}"+"</th></tr>\n"
  end
  
end
 


class AsciiDocTableGenerator < TableGenerator
  
  def generate
    "[options=\"header\"]\n" +
      "|==========\n" + super + "|==========\n"
  end

  def generate_row(row)
    "|"+"#{(row.map {|x| generate_item(x)}).join('|')}"+"\n"
  end

  def generate_header_row
    "|"+"#{(@header.map {|x| generate_item(x)}).join('|')}"+"\n"
  end
    
end
