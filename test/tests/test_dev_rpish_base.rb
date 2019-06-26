require 'test/unit'

require 'headlamp/dev/rpish'

class Test_rpish_base < Test::Unit::TestCase

  def test_base
    d = Headlamp::Dev::RPiSH.new
    assert_equal [8, 8, 15], d.config.values_at(:width, :height, :color_depth)
  end

end