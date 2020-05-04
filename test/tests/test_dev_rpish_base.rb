require 'test/unit'

require 'headlamp/dev/rpish'

class Test_rpish_base < Test::Unit::TestCase

  def test_base
    d = Headlamp::Dev::RPiSH.new
    assert_equal  8, d.width
    assert_equal  8, d.height
    assert_equal 16, d.color_depth
  end

end
