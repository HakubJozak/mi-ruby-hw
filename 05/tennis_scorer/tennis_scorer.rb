require 'pry'

# -*- encoding : utf-8 -*-
class TennisScorer

  def initialize
    @players = [ 0,0 ]
  end
  
  def score
    if @players == [ 40,40 ]
      'Deuce'
    else
      @players.map(&:to_s).join('-')
    end
  end

  def server!
    increase!(0,1)
  end

  def receiver!
    increase!(1,0)
  end

  private

  def increase!(who,other)
    return if @players.include?(:x)

    a = @players[who]
    b = @players[other]

    case
    when a == 0
      @players[who] = 15
    when a == 15
      @players[who] = 30
    when a == 30
      @players[who] = 40
    when a == :ADV
      @players[who] = 1
      @players[other] = :x
    when a == 40
      if b == :ADV
        @players[who] = 40
        @players[other] = 40
      elsif b == 40
        @players[who] = :ADV
      else
        @players[who] = 1
        @players[other] = :x
      end
    else
      raise "Oh darn. Unexpected case #{@players.inspect}!"
    end
  end


end
