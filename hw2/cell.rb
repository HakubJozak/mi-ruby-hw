#!/bin/ruby
# Represent single number in sudoku grid which could
# have 9 possible values unless a values is already
# assigned
class Cell
  def initialize(*args)
  end

  # true when value was already assigned
  def filled?
  end

  # number of possible values at this position
  def num_possible
  end

  # return true if number was deleted
  def exclude(num)
  end

  def to_i
  end
end
