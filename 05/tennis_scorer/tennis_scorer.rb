# -*- encoding : utf-8 -*-
class TennisScorer

  NAMES = %w( 0 15 30 40 )

  def initialize
    @server = 0
    @receiver = 0
  end
  
  # FIXME
  def score
    [ @server, @receiver ].map do |v|
      over, i = v.divmod(4)
      
      if over == 0
        NAMES[i]
      end
    end.join('-')

  end

  def server!
    @server += 1
  end

  def receiver!
    @receiver += 1    
  end

end
