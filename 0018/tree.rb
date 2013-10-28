class Tree
  @tree_array = []
  def initialize()
    @tree_array = []
  end
  
  def append_row(row)
    if @tree_array.size > 0
      if @tree_array[-1].size + 1 == row.size
        @tree_array.push(row)
        return True
      else
        return False
      end
    else
      if row.size == 1
        @tree_array.push(row)
        return True
      else
        return False
      end
    end
  end
  
  def append_element(elem)
    if @tree_array.size == 0 or @tree_array.size == 1
      @tree_array.push([])
      @tree_array[-1].push(elem)
    elsif @tree_array.size > 1
      if @tree_array[-1].size - 1 != @tree_array[-2].size
        @tree_array[-1].push(elem)
      else
        @tree_array.push([])
        @tree_array[-1].push(elem)
      end
    end
    return nil
  end
  
  def get_element(i, j)
    if @tree_array.size > i
      if @tree_array[i].size > j
        return @tree_array[i][j]
      else
        return 0
      end
    else
      return 0
    end
  end
  
  def has_row(i)
    return @tree_array.size > i
  end
  
  def has_col(i, j)
    if has_row(i)
      return @tree_array[i].size > j
    else
      return False
    end
  end
  
  def max_row(i)
    if has_row(i)
      return @tree_array[i].max
    else
      return nil
    end
  end
  
  def num_rows
    return @tree_array.size
  end
  
  def num_cols(row)
    return @tree_array[row].size
  end
  
  def final_rc()
    row = @tree_array.size - 1
    if row != -1
      col = @tree_array[row].size - 1
      if col != -1
        return [row, col]
      else
        return [row, nil]
      end
    else
      return [0, nil]
    end
  end
  
  def next_rc()
    rc = self.final_rc
    max_c = rc[0]
    if rc[1] == nil
      return [0, 0]
    end
    if rc[1] >= max_c
      return [rc[0]+1, 0]
    else
      return [rc[0], rc[1]+1]
    end
  end
end
