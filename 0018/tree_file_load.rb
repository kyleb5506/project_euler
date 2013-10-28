require_relative 'tree'

def open_tree_file(filename)
  tree = Tree.new()
  fp = File.open(filename, 'r')
  fp.readlines.each{ |line|
    line.chomp!
    line.split(/ /).map{|x| x.to_i}.each{|value|
      rc = tree.final_rc
      nrc = tree.next_rc
      if nrc[0] == 0 and nrc[1] == 0
        tree.append_element(value)
      else
        added_value = [tree.get_element(nrc[0]-1, nrc[1]-1), tree.get_element(nrc[0]-1, nrc[1])]
        tree.append_element(value + added_value.max)
      end
    }
  }
  return tree.max_row(-1)
end
