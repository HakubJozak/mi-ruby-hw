# -*- encoding : utf-8 -*-
class TennisScorer

  %w( 0 15 30 40 )

  def initialize
    @server = 0
    @receiver = 0
  end
  
  # FIXME
  def score
    if @server > 0
      '15-0'
    else
      '0-0'
    end
  end

  def server!
    @server += 1
  end

  def receiver!
    @receiver += 1    
  end

end
