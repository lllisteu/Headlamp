require 'test/unit'

require 'headlamp/canvas'

class Test_canvas_nice < Test::Unit::TestCase

  def test_nice
    assert_equal String, Headlamp::Canvas.new.inspect.class
  end

end
