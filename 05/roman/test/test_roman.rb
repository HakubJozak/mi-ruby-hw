require 'minitest/unit'
require 'minitest/autorun'
require_relative '../lib/roman'

class TestRoman < MiniTest::Unit::TestCase
  def test_simple
    assert_equal('i', Roman.new(1).to_s)
    assert_equal('ii', Roman.new(2).to_s)
    assert_equal('iii', Roman.new(3).to_s)
    assert_equal('iv', Roman.new(4).to_s)
    assert_equal('ix', Roman.new(9).to_s)
  end

  def test_constants
    assert_equal 'd', D.to_s
    assert_equal 500, D.to_i
    assert_equal 'm', M.to_s
    assert_equal 1000, M.to_i    
    assert_equal 2, II.to_i
  end

  def test_plus
    assert_equal 1005,(M + V).to_i
    assert_equal 1507,(M + D + V + II ).to_i    
  end
end
