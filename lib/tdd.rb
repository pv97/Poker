class Array

  def my_uniq
    self.uniq
  end

  def two_sum
    results = []
    i = 0
    while i < self.length - 1
      j = i + 1
      while j < self.length
        results << [i, j] if self[i] + self[j] == 0
        j += 1
      end
      i += 1
    end
    results
  end

  def my_transpose
    return self if self.length <= 1
    dim = self.length
    results = Array.new(dim) { Array.new(dim) { nil } }

    self.each_with_index do |row,i|
      row.each_with_index do |item,j|
        results[j][i] = item
      end
    end

    results
  end

  def stock_picker
    results = []
    best_profit = 0
    i = 0
    while i < self.length - 1
      j = i + 1
      while j < self.length
        current_profit = self[j] - self[i]
        results = [i,j] if current_profit > best_profit
        best_profit = current_profit if current_profit > best_profit
        j += 1
      end
      i += 1
    end
    results
  end



end
