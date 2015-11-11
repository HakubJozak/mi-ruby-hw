#!/usr/bin/env ruby

require 'pry'

module Summable
  def sum
    reduce(&:+)
  end
end


class VowelFinder
  include Enumerable
  include Summable
  
  def initialize(text)
    @text = text
  end

  def each
    return enum_for(__method__) unless block_given?

    @text.scan /([aeiyou])/i do |match|
      yield match.first.downcase
    end
    
  end
end


class Array
  include Summable
end
