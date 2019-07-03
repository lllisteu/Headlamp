require 'test/unit'

require 'headlamp/canvas'

class Test_canvas_misc < Test::Unit::TestCase

  def test_fill
    c = Headlamp::Canvas.new 4
    c.fill RGB.hex 'ff0088'
    assert_equal 'ff0088', c.mix.hex
    c.clear
    assert_equal [0,0,0], c.mix.values
  end

  def test_invert
    c = Headlamp::Canvas.new 5
    c.fill RGB.hex 'ff0055'
    c.invert!
    assert_equal '00ffaa', c.mix.hex
    assert_equal 1, c.colors.count
  end

end
