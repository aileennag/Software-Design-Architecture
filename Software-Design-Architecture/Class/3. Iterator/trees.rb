# Generator for depth-first search
def dfs(tree)
  Enumerator.new do |yielder|
    yielder << tree.first
    children = tree[1..-1]
    children.each do |child|
      dfs(child).each do |x|
        yielder << x
      end
    end
  end
end

# Generator for breadth-first search
def bfs(tree)
  Enumerator.new do |yielder|
    queue = [tree]
    while !queue.empty?
      node = queue.shift
      children = node[1..-1]
      yielder << node.first
      children.each do |child|
        queue << child
      end
    end
  end
end


t = ['A',
      ['B',
        ['E'],
        ['F']],
      ['C',
        ['G']],
      ['D',
        ['H'],
        ['I',
          ['L'],
          ['M']],
        ['J'],
        ['K',
          ['N',
            ['O'],
            ['P']]]]]

g = dfs(t)
g.each do |x|
  print x
end
puts

g = bfs(t)
g.each do |x|
  print x
end
puts

p bfs(t).take(5)
p dfs(t).take(5)