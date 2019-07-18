require 'test/unit'

require 'headlamp/canvas'

class Test_canvas_random < Test::Unit::TestCase

  def test_random
    sheet = Headlamp::Canvas.new(13,7)
    sheet.randomize!
    avg = sheet.mix

    sheet.shuffle!
    assert_equal avg.rrggbb, sheet.mix.rrggbb
    assert_equal 7, sheet.data.count
    assert_equal [13], sheet.data.map(&:count).uniq
  end

end
