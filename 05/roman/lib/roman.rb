class Roman
  MAX_ROMAN = 4999
  FACTORS = [['m', 1000], ['cm', 900], ['d', 500], ['cd', 400],
             ['c', 100], ['xc', 90], ['l', 50], ['xl', 40],
             ['x', 10], ['ix', 9], ['v', 5], ['iv', 4],
             ['i', 1]]

  def initialize(value)
    if value <= 0 || value > MAX_ROMAN
      fail 'Roman values must be > 0 and <= #{MAX_ROMAN}'
    end
    @value = value
  end

  def to_i
    @value
  end

  def to_s
    value = @value
    roman = ''
    FACTORS.each do |code, factor|
      count, value = value.divmod(factor)
      count.times { roman << code }
    end
    roman
  end

  def +(other)
    Roman.new(@value + other.to_i)
  end

end

I = Roman.new(1).freeze
II = Roman.new(2).freeze
V = Roman.new(5).freeze
D = Roman.new(500).freeze
M = Roman.new(1000).freeze


