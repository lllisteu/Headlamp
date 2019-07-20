require 'test/unit'

require 'headlamp/canvas'

class Test_canvas_rotate < Test::Unit::TestCase

  def test_rotate
    sheet = Headlamp::Canvas.new(13,7)
    sheet.rotate! 90
    assert_equal  7, sheet.width
    assert_equal 13, sheet.height

    sheet = Headlamp::Canvas.new(13,7)
    sheet.rotate! 180
    assert_equal 13, sheet.width
    assert_equal  7, sheet.height
  end

end
