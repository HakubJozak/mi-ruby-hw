require 'pry'

# -*- encoding : utf-8 -*-
class TennisScorer

  def initialize
    @server = 0
    @receiver = 0
  end
  
  def score
    s, i = @server.divmod(4)
    r, j = @receiver.divmod(4)    

    puts s,r
    
    if s == 0 && r == 0
      basic_score(i,j)
    else
      score_with_advantage(i,j)
    end
  end

  def server!
    @server += 1
  end

  def receiver!
    @receiver += 1    
  end

  private
  
  def score_with_advantage(i,j)
    diff = i-j

    puts diff
    
    case diff
    when 0
      'Deuce'
    when 1
      'ADV-40'
    when 2
      '1-0'
    when -1
      '40-ADV'
    when -2      
      '0-1'
    end
  end

  def basic_score(i,j)
    [ i, j ].map do |v|
      %w( 0 15 30 40 )[v]
    end.join('-')
  end


end
